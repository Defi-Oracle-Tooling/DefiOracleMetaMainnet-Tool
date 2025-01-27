# DefiOracleMetaMainnet-Tool

## Overview

This project includes tools and scripts for managing and deploying Hyperledger components, smart contracts, and configurations.

### Key Components

1. **Admin Panel**:
   - The `AdminPanel` class in `adminPanel.ts` initializes and uses various tools like `Tool1`, `Tool2`, `MonitoringTool`, and `GPTTool`.
   - Example usage of the `AdminPanel` is shown in `index.ts`.

2. **Deployment and Management**:
   - The `tool.py` script in `tool.py` provides functions to deploy, redeploy, restart, and update configurations for Hyperledger components.
   - The `.github/workflows/deploy.yaml` file defines a GitHub Actions workflow to automate deployment tasks.

3. **Smart Contracts**:
   - Smart contracts like `BridgeContract` are tested in `tests/test_contracts.js`.
   - Deployment scripts for smart contracts are in `scripts/deploy.js`.

4. **Configuration and Playbooks**:
   - Configuration files for nodes are in the `configs/nodes` directory, e.g., `configs/nodes/node1.yaml`.
   - Ansible playbooks for managing nodes are in the `playbooks` directory, e.g., `playbooks/node-management.yaml`.

## Using `pnpm` Package Manager

To use `pnpm` as the package manager, ensure you have `pnpm` installed. You can install it using:

```sh
npm install -g pnpm
```

## Install TypeScript

To install TypeScript using `pnpm`, run the following command:
```sh
pnpm add typescript --save-dev
```

## Run TypeScript Compiler

After installing TypeScript, run the TypeScript compiler to check for errors:
```sh
pnpm exec tsc --noEmit
```

## Automation Scripts

The following scripts are available in the `package.json` file to automate common tasks:

- **Install dependencies**: `pnpm install`
- **Build the project**: `pnpm build`
- **Run tests**: `pnpm test`
- **Deploy contracts**: `pnpm deploy`
- **Start the application**: `pnpm start`
- **Deploy using Ansible**: `pnpm deploy:ansible`
- **Redeploy using Ansible**: `pnpm redeploy:ansible`
- **Restart using Ansible**: `pnpm restart:ansible`
- **Update configuration using Ansible**: `pnpm update-config:ansible`

These scripts will help automate the tasks and ensure that the `pnpm` package manager is used throughout the project.