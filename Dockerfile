FROM node:alpine
MAINTAINER Rudy<454106101@163.com>
WORKDIR /tmp
ENV GIT_EMAIL 454106101@163.com
ENV GIT_NAME rudy

#切换国内镜像，并安装git
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add --no-cache git openssh

#安装cnpm，并安装hexo-cli
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
	&& cnpm install -g hexo-cli \
	&& cnpm install hexo-deployer-git --save 

#配置设定
RUN echo -e "Host *\n\tStrictHostKeyChecking no" > /etc/ssh/ssh_config \
	&& git config --global user.name $GIT_NAME \
	&& git config --global user.email $GIT_EMAIL

ENTRYPOINT ["hexo"]