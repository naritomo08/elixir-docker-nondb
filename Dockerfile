FROM elixir:1.11.3

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git vim sudo inotify-tools

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

RUN apt-get -y install nodejs

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID devel
RUN useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chown=devel:devel ./apps /apps

USER devel

WORKDIR /apps

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force hex phx_new 1.5.7
