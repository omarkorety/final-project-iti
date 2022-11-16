FROM jenkins/jenkins:lts-jdk11
USER root
#install kubectl
RUN apt update \
&& apt-get install gnupg gnupg1 gnupg2 -y && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && touch /etc/apt/sources.list.d/kubernetes.list 
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && apt-get update
RUN apt-get install -y kubectl && apt-get update -y 
#install docker
RUN apt install -y apt-transport-https ca-certificates curl software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && apt-get update -y
RUN apt-get install -y docker-ce docker-ce-cli  docker-compose-plugin
#install envsubst
RUN apt-get install gettext-base

# RUN touch /var/run/docker.sock && chown jenkins /var/run/docker.sock 
# USER jenkins


#install google-cloud-sdk
# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin


