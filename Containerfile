ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-bazzite-gnome}"
ARG IMAGE_TAG="${IMAGE_TAG:-testing}"

FROM ghcr.io/ublue-os/${BASE_IMAGE_NAME}:${IMAGE_TAG} AS okadora

COPY system_files /
COPY scripts /scripts

RUN flatpak remote-add --if-not-exists flathub --user https://dl.flathub.org/repo/flathub.flatpakrepo

RUN /scripts/preconfigure.sh && \
    /scripts/install_packages.sh && \
    /scripts/enable_services.sh && \
    /scripts/just.sh && \
    /scripts/cleanup.sh && \
    ostree container commit
