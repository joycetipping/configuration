FROM ubuntu
RUN apt-get update

# Packages
## Essentials
RUN apt-get install -y aptitude bc curl git rsync ssh sudo tmux vim wget
## Programming-related
RUN apt-get install -y ruby python3.5 python3-numpy perlconsole libcrypt-cbc-perl libcrypt-blowfish-perl octave r-base
## Other
RUN apt-get install -y samba

# Create user account
RUN useradd -ms /bin/bash joyce -G adm,sudo && echo "%sudo ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN rm -r /home/joyce

# Mount volumes and create symlinks
VOLUME /mac
RUN ln -s /mac/Users/joyce/home /home/joyce
RUN ln -s /mac/Volumes /Volumes

# Install youtube-dl manually
RUN sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

CMD /bin/bash
