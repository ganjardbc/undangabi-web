# AGENTS.md

## Quick Start & Dev Env

### Core Commands
* **Build Assets (Local Dev):** `npm run dev`
* **Watch Assets:** `npm run watch`
* **Build Assets (Production):** `npm run production` or `npm run prod`
* **Local PHP Server:** `php artisan serve`
* **Code Formatting:** `npm run prettier` (Formats `.js` and `.vue` files)

### Testing Commands
* Run all tests: `./vendor/bin/phpunit`
* Run specific test suite: `./vendor/bin/phpunit tests/Feature/`
* Run single test class or method: `./vendor/bin/phpunit --filter <TestName>`

### API Base URL Gotcha
The frontend `resources/js/app.js` automatically switches base URL by host detection:
```js
const isLocal = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' || window.location.hostname.endsWith('.test')
const api = isLocal ? 'http://localhost:8000' : 'https://undangabi.com'
```
*Never* hardcode `https://undangabi.com` or `http://localhost:8000` directly as the active API URL during changes. Use `api` or `Vue.prototype.apiURL`.

---

## Technical Stack & Architecture

### Backend & API
* **Framework:** Laravel 7 (PHP 8.1 in Docker / PHP 7.2.5+ supported)
* **Auth:** Laravel Sanctum. Session cookie configuration uses `7d` (7-day lifetime).
* **API Route Quirk:** *All* API endpoints in `routes/api.php` use `POST`, including resource read methods (e.g. `/api/role/getAll`, `/api/role/getByID`). Do not attempt standard RESTful `GET` requests for resources.
* **Direct File Downloads:** The routes `/download/guest/export/{id}`, `/download/guestBook/export/{id}`, `/download/reservation/export/{id}`, `/download/invitation/receipt/{id}` bypass the SPA router entirely. They are `GET` routes in `routes/web.php` handled directly by `PublicController` to output CSV/PDF/Excel.

### Frontend
* **Framework:** Vue 2 SPA (routed via `vue-router` in history mode).
* **Component Library:** Element UI (version 2.x).
* **State Management:** Namespaced Vuex modules (`resources/js/store/`).
* **Routing Structure:** Managed in `resources/js/routes/index.js` across five groups: `web` (marketing), `admin` (admin panel), `customer` (customer dashboard), `invitation` (public invitation viewer: `/:id` or `/:id/:guestId`), and `theme` (invitation preview/generator: `/invitation/:id`).

---

## File Uploads & Image Pathing

Uploaded assets (brides, invitations, events, galleries, etc.) go to `public/contents/{entity}/thumbnails/` and `public/contents/{entity}/covers/`.
Paths to these directories are bound to the Vue instance prototype in `app.js` using `api` as the prefix:
```js
Vue.prototype.brideImageThumbnailUrl = api + '/contents/brides/thumbnails/'
```
Always use these prototype properties (e.g., `this.brideImageThumbnailUrl`) rather than hardcoding the URL string or building it manually.

---

## Deployment & Dockerization

* **Deploy Script:** Use `./deploy.sh` for deployments.
  * Options: `--skip-pull` (skips `git pull`), `--skip-frontend` (skips asset build), `--no-cache` (forces full image rebuild).
* **Docker Setup:** Run via `docker compose up -d`.
  * **App Service:** Runs `php:8.1-apache` container.
  * **Database Service:** Runs `mysql:8.0`.
  * **Entrypoint Gotcha:** `/entrypoint.sh` blocks until the DB is reachable, then automatically runs:
    ```bash
    php artisan migrate --force
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache
    ```
    If modifying config files or environment variables on the host during development, remember to clear the cached config inside the container: `docker compose exec app php artisan config:clear`.
