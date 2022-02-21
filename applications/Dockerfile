FROM alpine
MAINTAINER Gabriel Moulin Dan <gmoulindan@gmail.com>

# basic flask environment
RUN apk add --no-cache cmd:pip3 \
	&& pip3 install --upgrade pip \
	&& pip3 install flask

ADD src/* /app/
WORKDIR /app
EXPOSE 80
CMD ["python3", "api.py"]