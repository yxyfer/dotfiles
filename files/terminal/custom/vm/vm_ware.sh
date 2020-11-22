#!/bin/sh
# VM_WARE - SetUp

VM_CRI=/Users/mathieu.rivier/Documents/EPITA/PIEscaped/PIEscaped.vmx

vm_connect()
{
    unset HISTFILE
    # USUAL - Not currently working
    #ssh "layer8@172.16.11.129" -p 22 -o ConnectTimeout=5

    # termporary HAck
    ssh -L 22:172.16.11.2:22 layer8@172.16.11.2 -o ConnectTimeout=5
}

vm_executer()
{
    vmrun $ACTION $VM

    if [[ "$ACTION" = "start" ]]; then
        osascript -e 'tell application "System Events" to set visible of application process "VMware Fusion" to false'
        sleep 3
        vm_connect
    fi

    if [[ "$ACTION" =  "stop" || "$ACTION" = "suspend" ]]; then
        sleep 1
        osascript -e 'quit app "VMware Fusion"'
        exit 0
    fi
}

[ "$#" -lt 2 ] && echo 'usage: vm_ware [vm_to_run] [action]' ||
    {
        case "$1" in
            "cri_vm")
                VM=$VM_CRI
                ;;
            *)
                echo "VM --- Unknown VM"
                ;;
        esac

        case "$2" in
            "start")
                ACTION="start"
                ;;
            "stop")
                ACTION="stop"
                ;;
            "suspend")
                ACTION="suspend"
                ;;
            *)
                echo "Action --- Wrong option"
                ;;
        esac

        [ -z $ACTION ] || [ -z $VM ] && echo "Wrong usage -h for help" || vm_executer
    }

exit 0;
