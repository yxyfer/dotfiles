
# Address of my CRI_VM

vm_connect()
{
    unset HISTFILE
    # Usual command - Not currently working!
    #ssh "layer8@172.16.11.129"  -p 22 -o ConnectTimeout=5

    #temporary fix
    ssh -L 22:172.16.11.2:22 layer8@172.16.11.2 -o ConnectTimeout=5
}
