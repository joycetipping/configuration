FROM ubuntu
RUN apt-get update

# Basic utilities
RUN apt-get install -y aptitude bc git rsync sudo vim

# Programming
RUN apt-get install -y ruby python3.5 python3-numpy perlconsole libcrypt-cbc-perl libcrypt-blowfish-perl octave r-base

# Create user account
RUN useradd -ms /bin/bash joyce -G adm,sudo && echo "%sudo ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN rm -r /home/joyce

# Mount volumes and create symlinks
# The mac root / is mounted in docker as /mac.
VOLUME /mac
RUN ln -s /mac/Users/joyce/home /home/joyce
RUN ln -s /mac/Volumes /Volumes

CMD /bin/bash
