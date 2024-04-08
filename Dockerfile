FROM ubuntu
LABEL MAINTAINER Author Maarten de Kruijf

ENV APP_LIST openssh-server


RUN apt-get update && apt-get install -y $APP_LIST

RUN mkdir -p /opt/{webshell,http}
COPY webshell.py /opt/webshell/
EXPOSE 80
EXPOSE 2222


RUN echo "root:W7kXBfpQr88uajvESY2v" | chpasswd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'Port 2222' >> /etc/ssh/sshd_config && \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

CMD service ssh start && \
    bash -c "exec -a webshell python3 /opt/webshell/webshell.py"
