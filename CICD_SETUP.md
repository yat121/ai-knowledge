# CI/CD Setup Guide

## GitHub Actions Secrets Required

To enable automatic deployment, you need to add these secrets in GitHub:

### 1. VPS_HOST
```
Value: 77.42.34.80
```

### 2. VPS_SSH_KEY
Your private SSH key for root user on VPS

To get your SSH key:
```bash
cat ~/.ssh/id_rsa
```

Or generate a new deploy key:
```bash
ssh-keygen -t rsa -b 4096 -C "github-actions" -f ~/.ssh/github_actions
# Add public key to VPS:
cat ~/.ssh/github_actions.pub >> ~/.ssh/authorized_keys
```

### 3. Add Secrets to GitHub

1. Go to: https://github.com/yat121/hk-cafe-map/settings/secrets/actions
2. Click "New repository secret"
3. Add each secret above

## Local Deployment Script

You can also deploy manually:

```bash
cd /home/yat121/.openclaw/workspace
./scripts/deploy-alpha360.sh
```

## Workflows Created

1. **deploy-alpha360.yml** - Deploys Alpha 360 on push
2. **deploy-all.yml** - Deploys all dashboards
3. **auto-commit.yml** - Auto commits changes to GitHub

## To Enable SSH Access for GitHub Actions

1. Generate a new SSH key (don't use your main key)
2. Add public key to VPS: `~/.ssh/authorized_keys`
3. Add private key to GitHub Secrets as `VPS_SSH_KEY`
