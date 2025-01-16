# Connect home using WireGuard
connect-home:
    #!/bin/bash
    echo "Connecting to home"
    sudo tailscale up --exit-node fw --accept-routes

# Disconnect from home using WireGuard
disconnect-home:
    #!/bin/bash
    echo "Disconnecting from home"
    tailscale down

# Install system flatpaks
_install-okadora-flatpaks:
    #!/bin/bash
    BAZZITE_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bazzite/main/scripts/gnome_flatpaks/flatpaks | tr '\n' ' ')"
    OKADORA_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/Okanilibe/okadora/main/flatpaks/okadora_flatpaks | tr '\n' ' ')"
    echo "Installing Bazzite Flatpaks.."
    flatpak --system -y install ${BAZZITE_FLATPAK_LIST}
    echo "Installing Okadora Flatpaks.."
    flatpak --system -y install ${ISENGARD_FLATPAK_LIST}
