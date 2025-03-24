#!/bin/bash

# Install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git openjdk-17-jdk unzip jq

# Download and install JetBrains Gateway & IntelliJ IDEA
wget https://download.jetbrains.com/idea/ideaIU-2024.1.tar.gz -O /tmp/idea.tar.gz
sudo tar -xzf /tmp/idea.tar.gz -C /opt
sudo mv /opt/idea-IU-* /opt/idea

# Configure IntelliJ Backend
/opt/idea/bin/remote-dev-server.sh install
/opt/idea/bin/remote-dev-server.sh run /home/ubuntu/my-new-project --ssh-link-user ubuntu --ssh-link-port 22

# Generate SSH key
ssh-keygen -t rsa -b 4096 -f /home/ubuntu/temp-user-key -N ""
cat /home/ubuntu/temp-user-key.pub >> /home/ubuntu/.ssh/authorized_keys
chmod 600 /home/ubuntu/.ssh/authorized_keys
