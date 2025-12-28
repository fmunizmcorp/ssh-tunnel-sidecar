#!/bin/bash

echo "🚀 Iniciando SSH Tunnel Sidecar..."

# Variáveis
SSH_HOST="${SSH_HOST:-192.168.192.164}"
SSH_PORT="${SSH_PORT:-22}"
SSH_USER="${SSH_USER:-flavio}"
SSH_PASS="${SSH_PASS:-sshflavioia}"
SOCKS_PORT="${SOCKS_PORT:-9050}"
HTTP_PROXY_PORT="${HTTP_PROXY_PORT:-8118}"

echo "📡 Configuração:"
echo "   SSH: ${SSH_USER}@${SSH_HOST}:${SSH_PORT}"
echo "   SOCKS Port: ${SOCKS_PORT}"
echo "   HTTP Proxy Port: ${HTTP_PROXY_PORT}"

# Configurar Privoxy
echo "🔧 Configurando Privoxy..."
cat > /etc/privoxy/config << PRIVOXY
listen-address  0.0.0.0:${HTTP_PROXY_PORT}
forward-socks5t / 127.0.0.1:${SOCKS_PORT} .
PRIVOXY

# Iniciar Privoxy
echo "▶️  Iniciando Privoxy..."
privoxy --no-daemon /etc/privoxy/config &
PRIVOXY_PID=$!
echo "✅ Privoxy rodando (PID: ${PRIVOXY_PID})"

sleep 2

# Testar conectividade SSH
echo "🔍 Testando conectividade SSH..."
export SSHPASS="${SSH_PASS}"
sshpass -e ssh -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    -o PreferredAuthentications=password \
    -o PubkeyAuthentication=no \
    -p ${SSH_PORT} ${SSH_USER}@${SSH_HOST} 'echo "SSH OK"' 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Conectividade SSH OK"
else
    echo "❌ ERRO: Não foi possível conectar via SSH"
    exit 1
fi

# Iniciar túnel SSH (SOCKS5) em FOREGROUND
echo "🔗 Iniciando túnel SSH..."
echo "   Mantendo conexão ativa..."

# Loop infinito para manter o túnel
while true; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Conectando túnel SSH..."
    
    sshpass -e ssh -o StrictHostKeyChecking=no \
        -o ServerAliveInterval=30 \
        -o ServerAliveCountMax=3 \
        -o ExitOnForwardFailure=yes \
        -o PreferredAuthentications=password \
        -o PubkeyAuthentication=no \
        -p ${SSH_PORT} \
        -D 127.0.0.1:${SOCKS_PORT} \
        ${SSH_USER}@${SSH_HOST} \
        -N
    
    EXIT_CODE=$?
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Túnel desconectado (código: ${EXIT_CODE})"
    echo "Reconectando em 5 segundos..."
    sleep 5
done
