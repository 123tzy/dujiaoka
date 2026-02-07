# 使用官方推荐的、包含 Nginx 和 PHP 7.4 的镜像
FROM webdevops/php-nginx:7.4

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器内
COPY . .

# 强制使用 Composer 安装依赖 (这一步会使用镜像自带的 PHP 7.4)
RUN composer install --no-dev --optimize-autoloader

# 设置目录权限，防止 403 错误
RUN chown -R application:application /app \
    && chmod -R 777 storage bootstrap/cache

# 暴露端口 (这个镜像默认使用 80 端口)
EXPOSE 80
