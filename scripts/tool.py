import subprocess
import argparse
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def deploy(component, nodes):
    """
    Deploy the specified component to the given nodes.
    """
    playbook = f"{component}-deploy.yaml"
    command = ["ansible-playbook", playbook, "--extra-vars", f"nodes={nodes}"]
    try:
        logging.info("Starting deployment...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Deployment successful: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Deployment failed: {e.stderr}")

def restart(component):
    """
    Restart the specified component.
    """
    command = ["ansible-playbook", f"{component}-restart.yaml"]
    try:
        logging.info("Restarting service...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Service restarted: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Service restart failed: {e.stderr}")

def update_config(path):
    """
    Update the configuration at the specified path.
    """
    command = ["ansible-playbook", "update-config.yaml", "--extra-vars", f"path={path}"]
    try:
        logging.info("Updating configuration...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Configuration updated: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Configuration update failed: {e.stderr}")

def redeploy(component, nodes):
    """
    Redeploy the specified component to the given nodes.
    """
    playbook = f"{component}-redeploy.yaml"
    command = ["ansible-playbook", playbook, "--extra-vars", f"nodes={nodes}"]
    try:
        logging.info("Starting redeployment...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Redeployment successful: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Redeployment failed: {e.stderr}")

def check_status(component):
    """
    Check the status of the specified component.
    """
    command = ["ansible-playbook", f"{component}-status.yaml"]
    try:
        logging.info("Checking status...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Status: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Status check failed: {e.stderr}")

def rollback(component, version):
    """
    Rollback the specified component to the given version.
    """
    command = ["ansible-playbook", f"{component}-rollback.yaml", "--extra-vars", f"version={version}"]
    try:
        logging.info("Starting rollback...")
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        logging.info(f"Rollback successful: {result.stdout}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Rollback failed: {e.stderr}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Tool for managing Hyperledger components.")
    parser.add_argument("action", choices=["deploy", "redeploy", "restart", "update-config", "check-status", "rollback"])
    parser.add_argument("--component", help="Component to manage (besu, firefly, cacti)")
    parser.add_argument("--nodes", help="Comma-separated list of nodes")
    parser.add_argument("--path", help="Path to configuration file")
    parser.add_argument("--version", help="Version to rollback to")
    args = parser.parse_args()

    if args.action == "deploy":
        deploy(args.component, args.nodes)
    elif args.action == "redeploy":
        redeploy(args.component, args.nodes)
    elif args.action == "restart":
        restart(args.component)
    elif args.action == "update-config":
        update_config(args.path)
    elif args.action == "check-status":
        check_status(args.component)
    elif args.action == "rollback":
        rollback(args.component, args.version)