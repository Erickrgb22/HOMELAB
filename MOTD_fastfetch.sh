#!/bin/bash

# Function to install Fastfetch
install_fastfetch() {
    echo "Installing Fastfetch..."
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
    sudo apt-get update
    sudo apt-get install fastfetch -y
}

# Check if Fastfetch is installed
if ! command -v fastfetch &> /dev/null; then
    install_fastfetch
else
    echo "Fastfetch is already installed."
fi

# Create the Fastfetch MOTD script
echo "#!/bin/bash" | sudo tee /etc/update-motd.d/99-fastfetch > /dev/null
echo "" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "# Check if Fastfetch is installed" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "if command -v fastfetch &> /dev/null; then" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "    # Run Fastfetch" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "    fastfetch" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "else" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "    echo 'Fastfetch is not installed. Please install it to see system information.'" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null
echo "fi" | sudo tee -a /etc/update-motd.d/99-fastfetch > /dev/null

# Make the script executable
sudo chmod +x /etc/update-motd.d/99-fastfetch

echo "Fastfetch MOTD script created at /etc/update-motd.d/99-fastfetch"