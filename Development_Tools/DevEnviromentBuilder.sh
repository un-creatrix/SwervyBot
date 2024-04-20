echo 'Swervy Bot Dev Enviroment Setup Script Started'
echo ' - Escalating Rights'
sudo su
echo ' - Updating System Applications'
apt update
echo ' - Upgrading System Applications'
apt upgrade

echo 'Dev Enviroment Setup Complete'
exit