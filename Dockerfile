FROM webdevops/php-nginx:7.4

# 设置网站根目录为 public，解决 403 错误
ENV WEB_DOCUMENT_ROOT=/app/public

WORKDIR /app

COPY . .

# 安装依赖
RUN composer install --no-dev --optimize-autoloader

# 设置权限
RUN chown -R application:application /app \
    && chmod -R 777 storage bootstrap/cache

EXPOSE 80
