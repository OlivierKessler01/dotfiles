
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

