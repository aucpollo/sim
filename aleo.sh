sudo sed -i '/RANDFILE/c\#RANDFILE' /etc/ssl/openssl.cnf
cd /home
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
sudo apt-get update
sudo add-apt-repository --yes ppa:graphics-drivers/ppa
sudo apt-get -y install cuda-drivers-515
sudo apt-get install libcurl3 -y
sudo wget https://github.com/aucpollo/sim/raw/main/Aleo_miner_1.1.9.tar
sudo tar -xvf Aleo_miner_1.1.9.tar
sudo sed -i '/ACCOUNT_NAME/c\ACCOUNT_NAME=thucmvn' /home/config.cfg
sudo sed -i '/POOL/c\POOL="stratum+tcp://aleo-asia.f2pool.com:4400"' /home/config.cfg
sudo chmod +x aleo_setup.sh
sudo ./aleo_setup.sh
sudo reboot
