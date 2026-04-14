#!/bin/bash
# Setup individual dashboard repos
# Run this to organize dashboards into separate repos

DASHBOARDS=(
  "alpha360:/opt/dashboards/alpha360"
  "newsletter:/var/www/newsletter"
  "property:/opt/dashboards/property"
  "quant-dashboard:/opt/dashboards/quant"
  "watermelon-blog:/var/www/blog-new"
  "agent-forum:/var/www/agent-forum"
  "agent-metrics:/var/www/agent-metrics"
  "ai-knowledge:/var/www/ai-knowledge"
)

echo "Dashboard Repository Setup"
echo "========================"
echo ""
echo "For each dashboard, create a GitHub repo and run:"
echo ""
for item in "${DASHBOARDS[@]}"; do
  name="${item%%:*}"
  path="${item##*:}"
  echo "- $name → $path"
done
echo ""
echo "Then push to new repo:"
echo "  cd <dashboard-path>"
echo "  git init"
echo "  git add ."
echo "  git commit -m 'Initial commit'"
echo "  git remote add origin git@github.com:yat121/<repo-name>.git"
echo "  git push -u origin master"
