#!/usr/bin/env python3
# Agency Agents Integration for OpenClaw
# Provides access to 68 professional AI agent personalities

import os
import json
from pathlib import Path

AGENTS_DIR = os.path.expanduser('~/.claude/agents')

def list_agents():
    agents = []
    for f in os.listdir(AGENTS_DIR):
        if f.endswith('.md'):
            agents.append(f.replace('.md', ''))
    return sorted(agents)

def get_agent(name):
    path = os.path.join(AGENTS_DIR, f'{name}.md')
    if os.path.exists(path):
        with open(path) as f:
            return f.read()
    return None

def get_agent_info(name):
    content = get_agent(name)
    if not content:
        return None
    
    # Extract description from first few lines
    lines = content.split('\n')[:20]
    description = ''
    color = 'blue'
    
    for line in lines:
        if line.startswith('description:'):
            description = line.replace('description:', '').strip()
        if line.startswith('color:'):
            color = line.replace('color:', '').strip()
    
    return {'name': name, 'description': description, 'color': color}

if __name__ == '__main__':
    import sys
    if len(sys.argv) > 1:
        if sys.argv[1] == 'list':
            for agent in list_agents():
                info = get_agent_info(agent)
                if info:
                    print(f'{info.get('color', 'blue'):10} | {agent:50} | {info.get('description', '')[:50]}')
        elif sys.argv[1] == 'get' and len(sys.argv) > 2:
            content = get_agent(sys.argv[2])
            if content:
                print(content)
            else:
                print(f'Agent not found: {sys.argv[2]}')
    else:
        print(f'Available agents: {len(list_agents())}')
        print('Usage: agency-agents list|get <name>')