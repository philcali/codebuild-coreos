FROM public.ecr.aws/docker/library/fedora:38

RUN yum install -y \
    podman \
    moby-engine \
    createrepo \
    systemd-ukify \
    systemd-boot \
    sbsigntools \
    rpmdevtools \
    rpmlint \
    git

COPY cosa.sh /usr/bin/cosa
