# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Stack

Laravel 7 (PHP) backend serving a Vue 2 SPA frontend. Laravel Mix (webpack) bundles assets.

- Auth: Laravel Sanctum (token stored in cookies, 7-day TTL)
- UI components: Element UI 2
- State: Vuex 3 (namespaced modules)
- Routing: vue-router 3 (history mode)
- CSS: SCSS compiled via Laravel Mix

## Commands

```bash
# Frontend
npm run dev         # build once (development)
npm run watch       # watch + rebuild on change
npm run prod        # production build
npm run prettier    # format JS/Vue files

# Backend
php artisan serve   # local dev server
php artisan migrate
php artisan db:seed
php artisan tinker

# Tests
./vendor/bin/phpunit                    # all tests
./vendor/bin/phpunit tests/Feature/     # feature tests only
./vendor/bin/phpunit --filter TestName  # single test
```

## Architecture

### Request flow

All web routes hit `AppController@main` which returns the Vue SPA shell (`resources/views/app.php`). The SPA handles routing client-side.

Exceptions: `/download/guest/export/{id}`, `/download/guestBook/export/{id}`, `/download/reservation/export/{id}`, `/download/invitation/receipt/{id}` — these bypass the SPA and return file downloads directly from `PublicController`.

### API structure

`routes/api.php` has three sections:
- `POST /api/auth/login|register` — unauthenticated
- `POST /api/public/*` — unauthenticated public reads (invitation by link, comments, guests, etc.)
- Everything else — Sanctum `auth:sanctum` middleware required

All API endpoints use POST, including reads (no REST conventions).

### Vue routing groups

Defined in `resources/js/routes/index.js`, five groups:
- `web` — public marketing site (`/`)
- `admin` — admin panel (`/admin`)
- `customer` — logged-in customer dashboard (`/customer`)
- `invitation` — public invitation viewer (`/:id`, `/:id/:guestId`)
- `theme` — invitation generator at `/invitation/:id`

### Theme system

Wedding invitation themes live in `resources/js/components/themes/`. Each theme has a folder (tulip, rose, lily, daisy, divia, clover, traditional, simpleWeb) with color variant subfolders (original, sageGreen, burgundy, lightBlue, etc.). Each variant has `Index.vue` (main view) and `Greetings.vue` (opening animation/cover).

`Generate.vue` is the router that picks which theme component to render based on the invitation's theme slug.

### Vuex store

`resources/js/store/index.js` registers all modules. Customer-facing data (invitation, brides, events, gallery, etc.) lives under `store/customers/`. Guest-facing data is under `store/guest/`.

### Image storage

Uploaded images go to `public/contents/{entity}/thumbnails/` and `public/contents/{entity}/covers/`. URL constants are set as Vue prototype properties in `app.js` pointing to `https://undangabi.com/contents/...`.

### API base URL

Hardcoded in `resources/js/app.js`:
```js
const api = 'https://undangabi.com'
// const api = 'http://localhost:8000'  ← uncomment for local dev
```

Toggle this comment when developing locally.

### Excel import/export

`maatwebsite/excel` handles bulk guest/reservation import-export. Export classes in `app/Exports/`, import classes in `app/Imports/`.

### PDF generation

`barryvdh/laravel-dompdf` renders `resources/views/invitation-receipt.blade.php` for invitation receipts.
