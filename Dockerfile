FROM public.ecr.aws/amazonlinux/amazonlinux:2

RUN amazon-linux-extras enable docker
RUN yum install -y git docker

COPY cosa.sh /usr/bin/cosa
