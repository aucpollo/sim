sudo apt update
sudo apt upgrade -y
sudo apt install dante-server -y
sudo curl https://raw.githubusercontent.com/aucpollo/sim/main/conf > /etc/danted.conf
sudo service danted start
sudo adduser blabla --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "blabla:blabla123" | sudo chpasswd
