# Ubuntu Repository Setup Script

This script allows you to easily configure and set up the package repositories for your Ubuntu system. You can select from several mirrors around the world, including Europe, North America, Asia, Africa, and Oceania, to improve your system's package download speeds.

## How to Use the Script

You can set up the repositories for your Ubuntu system by running the following command:

```bash
curl -s https://raw.githubusercontent.com/behzadti/set-ubuntu-repos/main/set-repos.sh | sudo bash

What This Script Does:
Downloads the script from GitHub.
Checks if curl is installed: If curl is not installed, the script will automatically install it.
Sets up package repositories: The script modifies your /etc/apt/sources.list file to use repositories from the selected region (Germany, United States, Singapore, South Africa, or Australia).
Backs up your current sources.list file: The script creates a backup of the existing sources.list file in /etc/apt/sources.list.bak so you can restore it if needed.
Available Repository Locations:
You can choose from the following repository locations:

Germany (Europe): A reliable and fast mirror located in Europe.
United States (North America): Repositories from the United States.
Singapore (Asia): Good for users in Asia.
South Africa (Africa): Optimized for users in Africa.
Australia (Oceania): Mirrors from Australia for users in Oceania.
Features:
Backup of sources.list: Before making any changes, the script automatically creates a backup of your current sources.list.
Restore Backup: If you need to revert to your previous repository setup, you can restore the backup.
Important Notes:
Root Privileges: The script requires root privileges to modify the /etc/apt/sources.list file. You will be prompted to enter your password when running the script.
Internet Connection: A stable internet connection is required to download the script and access the repository mirrors.
Ubuntu-based Systems: This script works on Ubuntu and other Ubuntu-based distributions like Linux Mint.
How to Restore the Backup:
If you wish to restore the previous repository settings, use the following command:

bash
Copy code
sudo cp /etc/apt/sources.list.bak /etc/apt/sources.list
sudo apt update
This will restore your previous sources.list configuration and update your package list.

License
This script is licensed under the MIT License. See the LICENSE for more details.



