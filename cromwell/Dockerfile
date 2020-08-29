FROM broadinstitute/cromwell:48



RUN apt-get -y update && apt-get -y install vim

RUN apt-get -y install python-pip

RUN \
   export DEBIAN_FRONTEND=noninteractive && \
   apt-get -y install condor

ADD requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt

ADD server.conf.tmpl /app/

ADD condor_config.local.tmpl /etc/condor/
ADD entrypoint.sh /entrypoint.sh

# Add the NMDC user
RUN mkdir /config &&  useradd -u 92188 -s /bin/bash -d /config/nmdcda -m -c 'NMDC Data User' nmdcda

RUN touch /app/server.conf && chown -R nmdcda /etc/condor/condor_config.local /app/server.conf
RUN \
    mkdir -p /global/project && \
    ln -s /global/project /global/cfs && \
    chown -R nmdcda /global

ENTRYPOINT [ '/entrypoint.sh' ]
