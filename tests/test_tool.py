import unittest
from unittest.mock import patch
from scripts.tool import deploy, restart, update_config, redeploy

class TestTool(unittest.TestCase):

    @patch('scripts.tool.subprocess.run')
    def test_deploy_success(self, mock_run):
        mock_run.return_value = subprocess.CompletedProcess(args=['deploy_command'], returncode=0, stdout='Success', stderr='')
        deploy()
        mock_run.assert_called_once_with(['deploy_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_deploy_failure(self, mock_run):
        mock_run.side_effect = subprocess.CalledProcessError(returncode=1, cmd='deploy_command', stderr='Error')
        deploy()
        mock_run.assert_called_once_with(['deploy_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_restart_success(self, mock_run):
        mock_run.return_value = subprocess.CompletedProcess(args=['restart_command'], returncode=0, stdout='Success', stderr='')
        restart()
        mock_run.assert_called_once_with(['restart_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_restart_failure(self, mock_run):
        mock_run.side_effect = subprocess.CalledProcessError(returncode=1, cmd='restart_command', stderr='Error')
        restart()
        mock_run.assert_called_once_with(['restart_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_update_config_success(self, mock_run):
        mock_run.return_value = subprocess.CompletedProcess(args=['update_config_command'], returncode=0, stdout='Success', stderr='')
        update_config()
        mock_run.assert_called_once_with(['update_config_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_update_config_failure(self, mock_run):
        mock_run.side_effect = subprocess.CalledProcessError(returncode=1, cmd='update_config_command', stderr='Error')
        update_config()
        mock_run.assert_called_once_with(['update_config_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_redeploy_success(self, mock_run):
        mock_run.return_value = subprocess.CompletedProcess(args=['redeploy_command'], returncode=0, stdout='Success', stderr='')
        redeploy()
        mock_run.assert_called_once_with(['redeploy_command'], check=True, capture_output=True, text=True)

    @patch('scripts.tool.subprocess.run')
    def test_redeploy_failure(self, mock_run):
        mock_run.side_effect = subprocess.CalledProcessError(returncode=1, cmd='redeploy_command', stderr='Error')
        redeploy()
        mock_run.assert_called_once_with(['redeploy_command'], check=True, capture_output=True, text=True)

if __name__ == '__main__':
    unittest.main()
