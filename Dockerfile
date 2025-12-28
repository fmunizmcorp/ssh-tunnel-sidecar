FROM alpine:latest

# Instalar ferramentas necessárias
RUN apk add --no-cache \
    openssh-client \
    sshpass \
    curl \
    bash \
    privoxy

# Criar diretórios
RUN mkdir -p /etc/privoxy

# Copiar arquivos de configuração
COPY start-tunnel.sh /start-tunnel.sh
COPY privoxy-config.txt /etc/privoxy/config

# Tornar executável
RUN chmod +x /start-tunnel.sh

# Expor porta do proxy HTTP
EXPOSE 8118

# Iniciar
CMD ["/start-tunnel.sh"]
