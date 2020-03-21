FROM balenalib/rpi-raspbian:latest

LABEL maintainer="wgrs33 <wagnerosss@gmail.com>"
LABEL description="Raspberry Pi docker based Jenkins server"

ENV JENKINS_HOME /var/lib/jenkins/
ENV JENKINS_SLAVE_AGENT_PORT 50000

# Install java-8
RUN apt update \
  && apt install openjdk-11-jre -y \
  && apt install wget gnupg git vim -y

# Install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - \
  && sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list' \
  && apt update \
  && apt install jenkins -y

WORKDIR ${JENKINS_HOME}
VOLUME ${JENKINS_HOME}

EXPOSE 8080 ${JENKINS_SLAVE_AGENT_PORT}

# Start Jenkins
CMD ["sh", "-c", "java -jar /usr/share/jenkins/jenkins.war"]