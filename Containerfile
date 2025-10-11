FROM quay.io/fedora/fedora-bootc:42

# Not reccomended to make updates, but I want security updates.
# https://docs.fedoraproject.org/en-US/bootc/building-containers/#_dnf_y_update
RUN --mount=type=cache,target=/var/lib/dnf \
    --mount=type=cache,target=/var/cache \
    --mount=type=tmpfs,target=/var/log \
    dnf update -y --security

# Install packages
RUN --mount=type=cache,target=/var/lib/dnf \
    --mount=type=cache,target=/var/cache \
    --mount=type=tmpfs,target=/var/log \
    dnf install -y \
    nu \
    helix \
    && \
    dnf clean all

# Add new as a shell
RUN echo "/usr/bin/nu" >> /etc/shells && \
    echo "/bin/nu" >> /etc/shells

# Lint
RUN bootc container lint
