FROM quay.io/fedora/fedora-bootc:42

RUN --mount=type=cache,target=/var/lib/dnf \
    --mount=type=cache,target=/var/cache \
    --mount=type=tmpfs,target=/var/log \
    dnf install -y \
    nu \
    helix \
    && \
    dnf clean all

RUN bootc container lint
