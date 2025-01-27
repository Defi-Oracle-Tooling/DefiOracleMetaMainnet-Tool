import subprocess
import argparse

def deploy(component, nodes):
    playbook = f"{component}-deploy.yaml"
    command = ["ansible-playbook", playbook, "--extra-vars", f"nodes={nodes}"]
    subprocess.run(command)

def restart(component):
    command = ["ansible-playbook", f"{component}-restart.yaml"]
    subprocess.run(command)

def update_config(path):
    command = ["ansible-playbook", "update-config.yaml", "--extra-vars", f"path={path}"]
    subprocess.run(command)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Tool for managing Hyperledger components.")
    parser.add_argument("action", choices=["deploy", "redeploy", "restart", "update-config"])
    parser.add_argument("--component", help="Component to manage (besu, firefly, cacti)")
    parser.add_argument("--nodes", help="Comma-separated list of nodes")
    parser.add_argument("--path", help="Path to configuration file")
    args = parser.parse_args()

    if args.action == "deploy":
        deploy(args.component, args.nodes)
    elif args.action == "restart":
        restart(args.component)
    elif args.action == "update-config":
        update_config(args.path)