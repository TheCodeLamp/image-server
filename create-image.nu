#!/usr/bin/nu



mkdir output

sudo nu -c "let image = 'ghcr.io/thecodelamp/image-surface'; podman image pull $image; (podman run
    --rm
    -it
    --privileged
    --pull=newer
    --security-opt label=type:unconfined_t
    -v ./iso-config.toml:/config.toml:ro
    -v ./output:/output
    -v /var/lib/containers/storage:/var/lib/containers/storage
    quay.io/centos-bootc/bootc-image-builder:latest
    --type anaconda-iso
    --rootfs btrfs
    $image)"
