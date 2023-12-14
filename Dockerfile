FROM python:3-alpine

ENV APP_HOME /app
WORKDIR $APP_HOME

# 安裝 Inkscape、基本編譯工具和字體
RUN apk add  inkscape \
        build-base \
        msttcorefonts-installer fontconfig \
        # 安裝 Noto CJK 字體
        noto-fonts-cjk && \
    update-ms-fonts && \
    fc-cache -f

# 安裝 Python 相關套件
RUN pip install Flask requests gevent

# 複製應用程式文件到容器中
COPY . $APP_HOME

# 啟動應用程式
CMD ["python", "inkscape.py"]
