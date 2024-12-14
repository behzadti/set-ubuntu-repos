#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root!"
  exit
fi

# Check if curl is installed
if ! command -v curl &> /dev/null; then
  echo "curl is not installed. Installing curl..."
  apt update && apt install -y curl
  if [ $? -eq 0 ]; then
    echo "curl installed successfully."
  else
    echo "Failed to install curl. Exiting."
    exit 1
  fi
fi

# Backup the sources.list file
backup_sources_list() {
  if [ ! -f /etc/apt/sources.list.bak ]; then
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
    echo "Backup of sources.list created successfully."
  else
    echo "Backup already exists."
  fi
}

# Set repositories for Germany (Europe)
set_germany_repos() {
  cat <<EOF > /etc/apt/sources.list
deb http://de.archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu focal-security main restricted universe multiverse
EOF
  echo "Repositories set to Germany (Europe)."
}

# Set repositories for the United States (North America)
set_us_repos() {
  cat <<EOF > /etc/apt/sources.list
deb http://us.archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu focal-security main restricted universe multiverse
EOF
  echo "Repositories set to the United States (North America)."
}

# Set repositories for Singapore (Asia)
set_singapore_repos() {
  cat <<EOF > /etc/apt/sources.list
deb http://sg.archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://sg.archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu focal-security main restricted universe multiverse
EOF
  echo "Repositories set to Singapore (Asia)."
}

# Set repositories for South Africa (Africa)
set_south_africa_repos() {
  cat <<EOF > /etc/apt/sources.list
deb http://za.archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://za.archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu focal-security main restricted universe multiverse
EOF
  echo "Repositories set to South Africa (Africa)."
}

# Set repositories for Australia (Oceania)
set_australia_repos() {
  cat <<EOF > /etc/apt/sources.list
deb http://au.archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://au.archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu focal-security main restricted universe multiverse
EOF
  echo "Repositories set to Australia (Oceania)."
}

# Show menu options
show_menu() {
  echo "Please select a continent to set the repositories:"
  echo "1) Germany (Europe)"
  echo "2) United States (North America)"
  echo "3) Singapore (Asia)"
  echo "4) South Africa (Africa)"
  echo "5) Australia (Oceania)"
  echo "6) Restore backup"
  echo "7) Exit"
  echo -n "Your choice: "
}

# Restore the backup
restore_backup() {
  if [ -f /etc/apt/sources.list.bak ]; then
    cp /etc/apt/sources.list.bak /etc/apt/sources.list
    echo "Backup restored successfully."
  else
    echo "No backup found!"
  fi
}

# Run menu
while true; do
  show_menu
  read choice
  case $choice in
    1)
      backup_sources_list
      set_germany_repos
      ;;
    2)
      backup_sources_list
      set_us_repos
      ;;
    3)
      backup_sources_list
      set_singapore_repos
      ;;
    4)
      backup_sources_list
      set_south_africa_repos
      ;;
    5)
      backup_sources_list
      set_australia_repos
      ;;
    6)
      restore_backup
      ;;
    7)
      echo "Exiting script."
      exit 0
      ;;
    *)
      echo "Invalid choice! Please try again."
      ;;
  esac
done
