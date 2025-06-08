# look up available virtual machine OSes
read -p "What os would you like to look for?" : oslookup
virt-install --os-variant list | grep $oslookup
echo "You can select from the list above."

#get variables for virtual machine
read -p "What OS would you like to install?" : osinstall
read -p "How much RAM would you like to allocate? (in MB)" : ram
read -p "How many CPUs would you like to allocate?" : cpu
read -p "How much disk space would you like to allocate? (in GB)" : diskspace

#a while loop until the user answers "bridge" or "default"
while true; do
    read -p "Would you like to use a network bridge or the default network card? (Please enter 'bridge' or 'default')" : network
    case $network in 
        bridge)
        networkcard="bridge=virbr0"
        break
        ;;
        default)
        networkcard="default"
        break
        ;;
        *)
        echo "That is not a valid network option. Please enter 'bridge' or 'default'."
    esac
done

## This is to set if the VM will be headless
while true do
    read -p "Would you like to run this VM headless (with seeing it on your screen)? (y/n)" : headless
    case $headless in 
        y)
        graphics = "none"
        break
        ;;
        n)
        graphics = "spice"
        break
        ;;
        *)
        echo "That is not a valid option. Please enter 'y' or 'n'."
    esac
done

read -p "what is the network location of your OS ISO?" : isolocation
read -p "what is the name of your virtual machine?" : vmname

sudo virt-install \
    --name $vmname \
    --os-variant $osinstall \
    --ram $ram \
    --vcpu $cpu \
    --disk=size=$diskspace \
    --network $networkcard \
    --graphics $graphics \
    --location $isolocation

