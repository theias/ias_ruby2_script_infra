FROM fedora:32

RUN yum -y update && \
    yum -y install \
        make \
        rpm-build \
        fakeroot

CMD /ias_ruby2_script_infra/dist/Docker/fedora/32/build-dist.sh
