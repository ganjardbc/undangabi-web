#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
log()  { echo -e "${GREEN}▶${NC} $*"; }
warn() { echo -e "${YELLOW}⚠${NC} $*"; }
err()  { echo -e "${RED}✗ ERROR:${NC} $*" >&2; exit 1; }
ok()   { echo -e "${GREEN}✓${NC} $*"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SKIP_PULL=false
SKIP_FRONTEND=false
NO_CACHE=false

usage() {
  echo "Usage: $0 [options]"
  echo ""
  echo "Options:"
  echo "  --skip-pull      Skip git pull"
  echo "  --skip-frontend  Skip npm build (use existing public/js, public/css)"
  echo "  --no-cache       Force full Docker rebuild"
  echo "  -h, --help       Show this help"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
    --skip-pull)     SKIP_PULL=true; shift ;;
    --skip-frontend) SKIP_FRONTEND=true; shift ;;
    --no-cache)      NO_CACHE=true; shift ;;
    -h|--help)       usage ;;
    *) err "Unknown flag: $1" ;;
  esac
done

echo -e "${BLUE}==============================${NC}"
echo -e "${BLUE}   UNDANGABI DEPLOY SCRIPT   ${NC}"
echo -e "${BLUE}==============================${NC}"
echo ""

# --- pre-flight ---
log "Checking prerequisites..."
[[ -f .env ]] || err ".env not found. Copy .env.example and fill in values."
command -v docker &>/dev/null || err "Docker is not installed."
docker info &>/dev/null || err "Docker daemon is not running."
ok "Prerequisites OK"

# --- git pull ---
if [[ "$SKIP_PULL" == false ]]; then
  log "Pulling latest code..."
  git pull
  ok "Code updated: $(git log -1 --format='%h %s')"
fi

# --- ensure upload dir exists ---
mkdir -p public/contents

# --- frontend build ---
if [[ "$SKIP_FRONTEND" == false ]]; then
  if command -v npm &>/dev/null; then
    log "Installing npm dependencies..."
    npm ci --silent
    log "Building frontend assets (production)..."
    npm run prod
    ok "Frontend assets built"
  else
    warn "npm not found — skipping frontend build."
    warn "Run 'npm run prod' on a machine with Node before deploying, or assets will be stale."
  fi
fi

# --- docker build ---
log "Building Docker image..."
if [[ "$NO_CACHE" == true ]]; then
  docker compose build --no-cache app
else
  docker compose build app
fi
ok "Image built"

# --- start services ---
log "Starting services..."
docker compose up -d
ok "Containers started"

# --- wait for app ---
log "Waiting for app to become ready (max 90s)..."
TIMEOUT=90
ELAPSED=0
until docker compose exec -T app php artisan --version &>/dev/null 2>&1; do
  sleep 3
  ELAPSED=$((ELAPSED + 3))
  if [[ $ELAPSED -ge $TIMEOUT ]]; then
    echo ""
    err "App did not start in ${TIMEOUT}s. Check logs with: docker compose logs app"
  fi
  printf "."
done
echo ""
ok "App is ready"

# --- summary ---
echo ""
echo -e "${GREEN}=============================="
echo -e "   DEPLOY COMPLETE"
echo -e "==============================${NC}"
echo ""
docker compose ps
echo ""
HOST_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "localhost")
echo "  URL:      http://${HOST_IP}"
echo "  App logs: docker compose logs -f app"
echo "  DB logs:  docker compose logs -f db"
echo ""
