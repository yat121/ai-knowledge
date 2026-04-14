# Universal Docker Compose Template

Standard template for all dashboards. Ensures consistency across all projects.

## Quick Start

1. Copy the template:
```bash
cp templates/universal-docker-compose.yml your-project/docker-compose.yml
```

2. Create `.env` file:
```bash
cp templates/.env.example your-project/.env
```

3. Edit `.env` with your project settings:
```env
PROJECT_NAME=my-project
DOMAIN=myproject.starcrab.space
DB_USER=myuser
DB_PASS=mypassword
DB_NAME=mydb
```

4. Update docker-compose.yml with your actual Dockerfile paths:
```yaml
build:
  context: ./frontend  # Your frontend path
  dockerfile: Dockerfile
```

5. Add Health Endpoints to your apps:

**Backend (Express/etc):**
```javascript
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date() });
});
```

**Frontend (Next.js API route):**
```javascript
// app/api/health/route.ts
export async function GET() {
  return Response.json({ status: 'ok' });
}
```

6. Deploy:
```bash
docker compose up -d --build
```

## Features

| Feature | Description |
|---------|-------------|
| Health Checks | All services have Docker health checks |
| Auto SSL | Traefik auto-generates SSL certificates |
| Networks | Isolated internal + traefik-public networks |
| Volumes | Persistent postgres + redis data |
| Restart | unless-stopped for all services |

## Deployment Checklist

- [ ] Copy template
- [ ] Create .env with PROJECT_NAME, DOMAIN, DB_*
- [ ] Update Dockerfile paths
- [ ] Add /api/health endpoints to backend
- [ ] Add /api/health endpoint to frontend (optional)
- [ ] Test locally: `docker compose up`
- [ ] Push to GitHub
- [ ] Deploy on VPS: `git pull && docker compose up -d --build`

## Backup Integration

Add to crontab on VPS:
```bash
0 2 * * * /opt/docker-tools/backup.sh
```

The backup script backs up:
- OpenClaw database
- All PostgreSQL databases

## Portainer Access

Manage all containers at: https://portainer.starcrab.space:9000

## Dozzle (Live Logs)

View real-time logs at: https://dozzle.starcrab.space:8080
