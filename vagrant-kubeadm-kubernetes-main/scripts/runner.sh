# Environment variables
GITHUB_TOKEN="AJRTUPQ2SWIKIV6MZSXVAFTHYOFW6"
REPO_URL="https://github.com/TBSimonfi/kube_cluster"

echo "Starting provisioning..."

# Function to install GitHub Actions runner.
function install_github_runner {
  sudo -u vagrant mkdir -p /home/vagrant/actions-runner && cd /home/vagrant/actions-runner
  sudo -u vagrant curl -o actions-runner-linux-x64-2.305.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.305.0/actions-runner-linux-x64-2.305.0.tar.gz
  sudo -u vagrant tar xzf ./actions-runner-linux-x64-2.305.0.tar.gz
  sudo -u vagrant ./config.sh --url $REPO_URL --token $GITHUB_TOKEN --unattended --replace
  sudo ./svc.sh install
  sudo ./svc.sh start
  echo "GitHub Actions runner installed and started."
}

install_github_runner