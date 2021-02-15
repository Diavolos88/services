# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ealexa <ealexa@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/03 15:10:03 by ealexa            #+#    #+#              #
#    Updated: 2021/02/03 15:11:09 by ealexa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/
ADD 	https://wordpress.org/wordpress-5.6.tar.gz .
RUN		tar -xzvf wordpress-5.6.tar.gz && rm wordpress-5.6.tar.gz
RUN		mkdir -p /var/www && mv /wordpress /var/www/

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/wp-config.php			/var/www/wordpress/
COPY	/srcs/start.sh				/

EXPOSE	5050

ENTRYPOINT sh start.sh
