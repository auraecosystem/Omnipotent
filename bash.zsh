scripts/build_bases.sh            # build every base listed in bases/manifest (skips existing)
scripts/build_bases.sh --rebuild  # force a rebuild
wget https://developer.download.nvidia.com/compute/cuda/13.3.1/local_installers/cuda_13.3.1_610.43.02_linux_sbsa.run
sudo sh cuda_13.3.1_610.43.02_linux_sbsa.run
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2604/sbsa/cuda-ubuntu2604.pin
sudo mv cuda-ubuntu2604.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/13.3.1/local_installers/cuda-repo-ubuntu2604-13-3-local_13.3.1-610.43.02-1_arm64.deb
sudo dpkg -i cuda-repo-ubuntu2604-13-3-local_13.3.1-610.43.02-1_arm64.deb
sudo cp /var/cuda-repo-ubuntu2604-13-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-13-3
