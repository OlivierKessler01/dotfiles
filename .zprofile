eval "$(/opt/homebrew/bin/brew shellenv)"

# build image : curl -LO https://github.com/archlinuxarm/ArchLinuxARM/releases/download/2024.09/ArchLinuxARM-aarch64-latest.tar.gz
# build image : qemu-img create -f qcow2 archarm.qcow2 100G


function run_arch_vm() {
  local VM_DISK="$HOME/VMs/archarm.qcow2"
  local BIOS_PATH="/opt/homebrew/share/qemu/edk2-aarch64-code.fd"

  if [[ ! -f "$VM_DISK" ]]; then
    echo "❌ VM disk image not found at: $VM_DISK"
    echo "Make sure you've created it using qemu-img."
    return 1
  fi

  if [[ ! -f "$BIOS_PATH" ]]; then
    echo "❌ UEFI BIOS file not found at: $BIOS_PATH"
    echo "Install it with: brew install edk2-ovmf"
    return 1
  fi

  echo "🚀 Launching Arch Linux VM with i3..."
  qemu-system-aarch64 \
    -machine virt,accel=hvf \
    -cpu host \
    -m 4096 \
    -smp 4 \
    -drive file="$VM_DISK",format=qcow2,if=virtio \
    -bios "$BIOS_PATH" \
    -display cocoa \
    -serial mon:stdio \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0
}

alias k="kubectl"

aws_profile() {
    local aws_profile aws_region
    aws_profile="$(grep '\[profile' ~/.aws/config | sed -E 's|^\[profile (.*)\].*$|\1|g' | fzf --header="select aws profile")"
    export AWS_PROFILE="${aws_profile}"
    echo "Switching to aws profile $aws_profile"
    aws_region=$(awk '/^\[.*\]$/{obj=$0}/=/{print obj $0}' ~/.aws/config |
                     grep "$AWS_PROFILE" |
                     grep region |
                     sed 's/.*=//' |
                     sed 's/^ *//g'
              )
    aws_region=$(awk -v profile="profile ${aws_profile}" '
        $0 ~ /^\[/ { section = $0 }
        $1 == "region" && section == "[" profile "]" { print $3 }
    ' ~/.aws/config)
    if [[ -z "$aws_region" ]]; then
        source_profile=$(awk -v profile="profile ${aws_profile}" '
            $0 ~ /^\[/ { section = $0 }
            $1 == "source_profile" && section == "[" profile "]" { print $3 }
        ' ~/.aws/config)
        if [[ -z "$source_profile" ]]; then
            echo "Error: Could not find region or source_profile for profile $AWS_PROFILE"
            return 111
        fi
        aws_region=$(awk -v profile="profile ${source_profile}" '
            $0 ~ /^\[/ { section = $0 }
            $1 == "region" && section == "[" profile "]" { print $3 }
        ' ~/.aws/config)
    fi
    unset AWS_REGION
    export AWS_REGION='eu-west-1'
    #export AWS_REGION="$aws_region"
    echo "Making sure we are logged in"
    aws sts get-caller-identity >/dev/null || aws sso login
}

export PATH=$PATH:$(go env GOPATH)/bin


# Set MTU to 1400 for en0 to avoid issues with VPNs and certain network configurations (like my fk phone hotspot)
sudo ifconfig en0 mtu 1400
