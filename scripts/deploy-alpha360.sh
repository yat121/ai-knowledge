#!/bin/bash
# ============================================
# CI/CD Deployment Script
# Alpha 360 Dashboard
# ============================================

set -e

APP_NAME="alpha360"
VPS_HOST="root@77.42.34.80"
APP_DIR="/opt/dashboards/$APP_NAME"
WORKSPACE="/home/yat121/.openclaw/workspace"

echo "🚀 Starting CI/CD Deployment for $APP_NAME..."

# Step 1: Pull latest code
echo "📥 Pulling latest code..."
cd $WORKSPACE
git pull origin main

# Step 2: Sync to VPS
echo "📤 Syncing to VPS..."
rsync -avz --delete \
  --exclude 'node_modules' \
  --exclude '.next' \
  --exclude '.git' \
  --exclude 'dist' \
  $WORKSPACE/alpha360/frontend/ \
  $VPS_HOST:$APP_DIR/frontend/

rsync -avz --delete \
  --exclude 'node_modules' \
  --exclude '.git' \
  $WORKSPACE/alpha360/backend/ \
  $VPS_HOST:$APP_DIR/backend/

rsync -avz --delete \
  $WORKSPACE/docker/alpha360/ \
  $VPS_HOST:$APP_DIR/

# Step 3: Build and deploy
echo "🐳 Building and deploying..."
ssh $VPS_HOST << EOF
  cd $APP_DIR
  docker-compose down
  docker-compose up -d --build
  docker-compose logs --tail=30
EOF

# Step 4: Health check
echo "🏥 Health check..."
sleep 10
STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://alpha360.starcrab.space)

if [ "$STATUS" = "200" ]; then
  echo "✅ Deployment successful! Status: $STATUS"
else
  echo "⚠️  Health check returned: $STATUS"
fi

echo "📊 Container status:"
ssh $VPS_HOST "cd $APP_DIR && docker-compose ps"

echo "✅ CI/CD Pipeline complete!"