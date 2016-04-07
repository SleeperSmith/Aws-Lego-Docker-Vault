FROM ubuntu:14.04.4

# Create directory
RUN mkdir /home/local
WORKDIR /home/local

ADD https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_linux_amd64.zip /home/local/
RUN apt-get update && apt-get install -y nano unzip curl && \
	unzip vault_0.5.2_linux_amd64.zip

ADD conf.hcl /home/local/
ADD init.sh /home/local/
RUN chmod +x ./init.sh

ENTRYPOINT ["/home/local/init.sh"]
