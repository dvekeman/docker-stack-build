FROM debian:stretch

RUN apt-get update -y && apt-get install -y curl libpq-dev

RUN curl -sSL https://get.haskellstack.org/ | sh
RUN echo "export PATH=$PATH:/root/.local/bin" >> /root/.bash_profile

RUN mkdir -p /src/stack-ws
RUN mkdir -p /home
RUN ln -s /root /home/root

ENTRYPOINT ["/bin/bash", "-c", "cd /src/stack-ws && stack build"]
