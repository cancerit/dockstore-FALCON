FROM ubuntu:16.04 as builder

USER root
RUN bash -c 'apt-get update -yq >& this.log || (cat this.log 1>&2 && exit 1)'
RUN bash -c 'apt-get install -qy --no-install-recommends\
                build-essential \
                wget \
                ca-certificates \
                git \
        >& this.log || (cat this.log 1>&2 && exit 1)'

FROM  ubuntu:16.04

LABEL maintainer="cgphelp@sanger.ac.uk" \
      uk.ac.sanger.cgp="Cancer, Ageing and Somatic Mutation, Wellcome Trust Sanger Institute" \
      version="1.0.0" \
      description="FALCON docker for CASM use"

RUN bash -c 'apt-get update -yq >& this.log || (cat this.log 1>&2 && exit 1)'
RUN bash -c 'apt-get install -qy --no-install-recommends\
                build-essential \
                wget \
                ca-certificates \
                git \
        >& this.log || (cat this.log 1>&2 && exit 1)'


ENV OPT /opt/wtsi-cgp
ENV PATH $OPT/bin:$PATH

RUN mkdir -p $OPT

ADD build/opt-build.sh build/
RUN bash build/opt-build.sh $OPT

## USER CONFIGURATION
RUN adduser --disabled-password --gecos '' ubuntu && chsh -s /bin/bash && mkdir -p /home/ubuntu

USER    ubuntu
WORKDIR /home/ubuntu

CMD ["/bin/bash"]
