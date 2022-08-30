FROM python:3.8-alpine3.10

COPY requirements.txt /tmp/requirements.txt
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps gcc libc-dev make tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r /tmp/requirements.txt \
    && apk del .build-deps gcc libc-dev make tzdata

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app
ENV TZ=Asia/Shanghai

EXPOSE 8888

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
