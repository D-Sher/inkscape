# 使用 Python 3 的 Alpine Linux 版本作为基础镜像
FROM python:3-alpine

# 设置工作目录
ENV APP_HOME /app
WORKDIR $APP_HOME

# 安装 Inkscape、基础构建工具和字体支持
# 然后安装 Noto CJK 字体
RUN apk add --no-cache inkscape \
        build-base \
        msttcorefonts-installer fontconfig \
        noto-fonts-cjk && \
    update-ms-fonts && \
    fc-cache -f

# 安装 Flask、requests 和 gevent
RUN pip install Flask requests gevent

# 将应用程序文件复制到容器内
COPY . $APP_HOME

# 设置容器启动时执行的命令
CMD ["python", "inkscape.py"]
