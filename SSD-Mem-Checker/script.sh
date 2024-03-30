echo "WARNING: Do NOT run this script directly. Read and understand it first, then run the commands manually, one by one."
exit 1

# ===== START HERE =====

# Update the system
sudo apt update && sudo apt upgrade -y

# === SSD Health Checking ===

sudo apt install smartmontools
sudo fdisk -l # Find the SSD device name, e.g. /dev/nvme0n1 or /dev/sda

sudo smartctl -H /dev/nvme0n1 # Or whatever your SSD device name is

# OR 

sudo apt-get install nvme-cli
sudo nvme smart-log /dev/nvme0n1 # Or whatever your SSD device name is.
    # Look for `critical_warning` values


# === Memory Health Checking ===

echo "WARNING: This does stress testing on your compujter hardware."

wget https://www.mersenne.org/download/software/v30/30.8/p95v308b17.linux64.tar.gz
tar -xvf p95v308b17.linux64.tar.gz
./mprime

# Choose N to sending the data to their server
# Choose type 3 of the torture test.