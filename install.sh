BININSTALL="/usr/local/bin/"
LIBINSTALL="/usr/local/lib/redseagen"

printf "\033[33;1mHolyC Builder\033[0m\n"

read -p "Would you like to install? (Y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then

echo "HolyC Builder will now install the required binaries..."
echo -ne "Installing Binaries...\r"
# WRAPPER
sudo chmod a+x holyc
sudo cp holyc $BININSTALL

# RedSeaGen Installer
sudo chmod a+x redseagen
sudo cp redseagen $LIBINSTALL

# TempleOS // For Virt
sudo cp temple /usr/local/lib/temple
echo "Finished               "
fi

