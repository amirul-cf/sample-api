#!/bin/bash

# Update and upgrade the system packages
sudo apt update && sudo apt upgrade -y

# Install Node.js (LTS version) and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Install project dependencies
npm install

# Start the application using PM2 (replace 'app.js' with your entry point file)
pm2 start ecosystem.config.js

# Save the PM2 process list and configure it to start on boot
pm2 save
pm2 startup systemd

# Enable and start the PM2 service
sudo systemctl enable pm2-$(whoami).service
sudo systemctl start pm2-$(whoami).service

echo "Setup complete. Your application is now running with PM2."
