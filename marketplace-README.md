# Deploy and Host Appsmith on Railway

## About Hosting

Railway provides a modern, streamlined platform for deploying web applications and databases. This template bundles **Appsmith** — the open-source platform for building internal tools, admin panels, and dashboards — running on the official Docker image with built-in storage. One-click deploy, persistent data, zero vendor lock-in.

## Why Deploy

Deploying this template gives you a full internal-tools platform in minutes:

- **Open-source internal tools builder** — drag-and-drop UI, no frontend code required
- **Official image pinned** — `appsmith/appsmith-ce:v1.77.0` from Docker Hub (not a stale community build)
- **Self-contained** — MongoDB and Redis are embedded in the image; no external database services needed
- **Persistent storage** — mount a volume at `/appsmith-stacks` to keep your apps and data across redeploys
- **Production-ready defaults** — healthcheck on `/api/v1/health`, restart policy
- **40+ prebuilt widgets** — tables, forms, charts, maps, and more, connectable to any REST/GraphQL API or database

## Common Use Cases

- **Internal tools** — admin panels, dashboards, and CRUD interfaces for your team
- **Operations** — inventory, order management, support ticket views
- **Data visualization** — connect Postgres, MySQL, or any REST API and build dashboards
- **Startups** — ship internal tooling without hiring frontend developers

## Dependencies for

This template requires:

### Deployment Dependencies

- **Volume** — mount a volume at `/appsmith-stacks` (MongoDB + Redis + uploads live there; without it all data is lost on redeploy)
- **`PORT`** — fixed to `80` (Railway routes traffic/healthchecks by this variable)
- **`APPSMITH_ENCRYPTION_PASSWORD`** — encryption password for secrets (auto-generated in the wizard)
- **`APPSMITH_ENCRYPTION_SALT`** — encryption salt for secrets (auto-generated in the wizard)

## Getting Started

1. Click **Deploy on Railway**
2. In the deploy wizard, set `PORT=80` and the encryption variables
3. Add a volume mounted at `/appsmith-stacks`
4. Wait ~3 minutes for first boot (embedded MongoDB initialization)
5. Open the generated domain — create your admin account

## Next Steps

- **Create your first app** — from a template or blank canvas
- **Connect a datasource** — Postgres, MySQL, REST API, or any of the 40+ integrations
- **Custom domain** — add one to your Railway service

## License

Apache-2.0 (Appsmith)

---
<!-- IMPORTANT: the six headings below are MANDATORY for Railway marketplace
     acceptance (publish fails without them). Do not remove or rename:
     "# Deploy and Host", "## About Hosting", "## Why Deploy",
     "## Common Use Cases", "## Dependencies for", "### Deployment Dependencies".
     This is the MARKETPLACE overview — separate from the repo README. -->
