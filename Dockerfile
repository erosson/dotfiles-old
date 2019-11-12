# Use docker to test my new-machine-setup script. We're only testing that it
# runs without crashing; no functionality's tested. The docker image doesn't
# completely match a clean ubuntu install on real hardware - some packages are
# missing - but it's close enough.
#
# :rolling is the latest ubuntu release. (:latest is the latest LTS)
# https://hub.docker.com/_/ubuntu/
FROM ubuntu:rolling

RUN apt-get update

# For testing, set up a non-root sudoers user. For non-interactive testing, sudo with nopasswd.
RUN apt-get -y install sudo
ENV USER dotfilesuser
# https://stackoverflow.com/questions/25845538/using-sudo-inside-a-docker-container
RUN useradd -m $USER && echo "$USER:$USER" | chpasswd
RUN adduser $USER sudo
# https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USER
WORKDIR /dotfiles-setup/
ENV CI 1
ADD . .
RUN cat /etc/lsb-release

CMD /dotfiles-setup/setup.sh
