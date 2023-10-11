# Due to custom Fedora installation on wsl the
# default PROPAGATION on the root mount is set to private
# Podman will complain with a warning about this
# so here is a fix that sets it to public might require sudo

if findmnt -o PROPAGATION / | grep -q "private"; then
    echo "You've got an inconvenience on line ${LINENO} in file ${BASH_SOURCE[0]}"
    # mount --make-rshared /
fi
