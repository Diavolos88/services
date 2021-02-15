# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ealexa <ealexa@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/03 15:10:26 by ealexa            #+#    #+#              #
#    Updated: 2021/02/03 15:10:27 by ealexa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

WORKDIR /home

RUN apk update && apk add influxdb \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/	\
	&& mkdir -p /var/lib/influxdb \
	&& mkdir -p /etc/influxdb && mkdir -p /etc/telegraf

RUN chown -R influxdb:influxdb /var/lib/influxdb

COPY ./run_influxdb.sh /home/

COPY ./telegraf.conf /etc/telegraf/

VOLUME ["/var/lib/influxdb"]

EXPOSE 8086

CMD ["sh", "run_influxdb.sh"]
