#!/bin/bash

# Check the current directory
current_dir=$(pwd)
echo "Current directory: $current_dir"

# Create the folder structure
mkdir -p configs/nodes playbooks scripts monitoring/.grafana .github/workflows contracts/build azure logs tests

# Create empty configuration files
touch configs/config.yaml
touch configs/nodes/node1.yaml
touch configs/nodes/node2.yaml

# Create Ansible playbooks
touch playbooks/node-management.yaml
touch playbooks/besu-deploy.yaml
touch playbooks/firefly-deploy.yaml
touch playbooks/cacti-deploy.yaml
touch playbooks/upgrade.yaml
touch playbooks/update-config.yaml
touch playbooks/restart.yaml

# Create Python and JavaScript scripts
touch scripts/tool.py
touch scripts/deploy_contracts.js

# Create monitoring files
touch monitoring/prometheus.yml
touch monitoring/grafana/grafana_dashboard.json

# Create GitHub workflow
touch .github/workflows/deploy.yaml

# Create contract files
touch contracts/BridgeContract.sol
touch contracts/build/BridgeContract.json

# Create Azure deployment files
touch azure/azuredeploy.json
touch azure/deploy.sh
touch azure/regions.csv

# Create log files
touch logs/besu.log
touch logs/deployment.log

# Create test files
touch tests/test_tool.py
touch tests/test_playbooks.yaml
touch tests/test_contracts.js

# Create documentation and metadata files
touch README.md
touch requirements.txt
touch LICENSE

echo "File tree created successfully within $current_dir directory."
