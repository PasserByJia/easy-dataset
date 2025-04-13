# 使用Node.js 18作为基础镜像
FROM node:18

#安装编译工具
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    libpng-dev \
    libtiff-dev

# 设置工作目录
WORKDIR /app

# 复制package.json和pnpm-lock.yaml
COPY package.json pnpm-lock.yaml* ./

# 安装依赖
RUN npm install

# 复制所有文件
COPY . .

# 构建应用
RUN npm run build

# 暴露端口
EXPOSE 1717

# 启动应用
CMD ["npm","run","start"]