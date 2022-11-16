FROM ubuntu

ARG USER_ID

ARG GROUP_ID

RUN apt-get update && apt-get install sudo wget -y

RUN addgroup --gid $GROUP_ID user

RUN adduser --uid $USER_ID --gid $GROUP_ID user

RUN usermod -aG sudo user

RUN echo user:user | chpasswd

RUN echo 'user  ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers.d/user

USER user

RUN sudo apt-get install npm -y 

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash