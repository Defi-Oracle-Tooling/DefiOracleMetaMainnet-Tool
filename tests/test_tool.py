import pytest
from tool import deploy, redeploy, restart, update_config

def test_deploy():
    assert deploy("besu", "node1,node2") is None

def test_redeploy():
    assert redeploy("firefly") is None

def test_restart():
    assert restart("firefly") is None

def test_update_config():
    assert update_config("configs/config.yaml") is None
