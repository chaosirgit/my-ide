FROM ubuntu:20.04
MAINTAINER Ethan Kuo <mrnicolascoge@gmail.com>
WORKDIR /root
USER root
# 安装oh-my-zsh
RUN apt-get update && \
    apt-get install -y zsh curl git wget

RUN echo Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

SHELL ["/bin/zsh","-c"]

# 安装 PHP 和 composer
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y tzdata

RUN apt-get install -y software-properties-common

RUN apt-get update

RUN add-apt-repository ppa:ondrej/php -y 

RUN apt-get update

RUN apt-get install -y php8.1 php8.1-fpm php8.1-bcmath php8.1-curl php8.1-decimal php8.1-gd php8.1-mbstring php8.1-mcrypt php8.1-redis php8.1-swoole php8.1-opcache php8.1-xml php8.1-zip php8.1-pgsql

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

# 安装 node 和 npm 和 n
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n

RUN bash n lts

RUN npm install -g n

RUN rm n

# 安装 golang

RUN wget https://go.dev/dl/go1.19.linux-amd64.tar.gz

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz

RUN rm go1.19.linux-amd64.tar.gz

ENV PATH="${PATH}:/usr/local/go/bin"

ENV GO111MODULE="on"

# 安装 neovim
# unzip lua lsp 需要用
RUN add-apt-repository ppa:neovim-ppa/unstable && apt-get update

RUN apt-get install -y neovim unzip

# 拷贝配置
COPY ./config/nvim /root/.config/nvim

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb

RUN apt install ./ripgrep_13.0.0_amd64.deb \
    && rm ripgrep_13.0.0_amd64.deb

RUN npm install -g fd-find

# 安装 C 编译器 (gcc)

RUN apt install -y build-essential python3.8-venv

# 安装插件

RUN nvim -c "PackerSync" \
         -c "qall"

WORKDIR project

# CMD ["nvim"]
