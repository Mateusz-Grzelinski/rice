FROM archlinux/base:latest

RUN pacman -Syu --noconfirm sudo make

ARG USERNAME=mat
ARG PASSWORD=mat

# create new user
RUN useradd --create-home --user-group --groups wheel --shell /bin/bash ${USERNAME}
# add PASSWORD for USERNAME
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
# enable sudo for wheel group
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

COPY . /home/${USERNAME}/.dotfiles

WORKDIR /home/${USERNAME}/.dotfiles/
USER mat

# RUN yes | make -f /home/${USERNAME}/.dotfiles/makefile dots

