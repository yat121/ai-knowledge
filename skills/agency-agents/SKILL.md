# Agency Agents Skill

Use agency-agents to access 68 professional AI agent personalities for specialized tasks.

## Quick Access

List all agents:
```bash
python3 ~/.openclaw/scripts/agency-agents.py list
```

Get specific agent:
```bash
python3 ~/.openclaw/scripts/agency-agents.py get <agent-name>
```

## Available Categories

### Engineering Agents
| Agent | Specialty |
|-------|-----------|
| engineering-frontend-developer | React, Vue, UI, performance |
| engineering-backend-architect | APIs, databases, scalability |
| engineering-ai-engineer | ML models, deployment |
| engineering-devops-automator | CI/CD, infrastructure |
| engineering-mobile-app-builder | iOS/Android, React Native |
| engineering-rapid-prototyper | Fast MVPs |
| engineering-security-engineer | Security review |

### Design Agents
| Agent | Specialty |
|-------|-----------|
| design-ui-designer | Visual design |
| design-ux-architect | UX architecture |
| design-brand-guardian | Brand strategy |
| design-whimsy-injector | Creative injection |

### Marketing Agents
| Agent | Specialty |
|-------|-----------|
| marketing-content-creator | Content writing |
| marketing-growth-hacker | Growth strategies |
| marketing-reddit-community-builder | Reddit engagement |

### Data Agents
| Agent | Specialty |
|-------|-----------|
| data-analytics-reporter | Data analysis |
| data-consolidation-agent | Data consolidation |

## Usage in OpenClaw

When user asks for a specialized task, you can:
1. Spawn a subagent with the agency-agents persona
2. Use the agent definition as context for the task

Example workflow:
```
User: Help me design a React component
→ Read engineering-frontend-developer.md for guidance
→ Apply best practices and patterns from the agent
→ Or spawn subagent with this persona for complex tasks
```
