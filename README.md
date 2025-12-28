# 🔗 SSH Tunnel Sidecar

Container sidecar que cria um túnel SSH com proxy HTTP para permitir que outros containers acessem recursos através de uma rede ZeroTier privada.

## 🎯 Problema que Resolve

O EasyPanel roda containers em rede bridge, que não têm acesso à rede ZeroTier do host. Este sidecar resolve isso criando um túnel SSH que outros containers podem usar como proxy.

## 🏗️ Arquitetura

```
[Container App] 
    ↓ HTTP Proxy (http://ssh-tunnel:8118)
[SSH Tunnel Sidecar]
    ↓ SOCKS5 (localhost:9050)
[SSH Tunnel] 
    ↓ ZeroTier Network
[Servidor Privado 192.168.192.164]
    ↓
[USCall https://uscall2.opennew.com.br]
```

## 🚀 Como Usar no EasyPanel

### 1. Criar novo projeto no EasyPanel

1. Nome: `ssh-tunnel-sidecar`
2. Tipo: Docker
3. Repository: (este repo)
4. Build Context: `.`

### 2. Configurar variáveis de ambiente

```bash
SSH_HOST=192.168.192.164
SSH_PORT=22
SSH_USER=flavio
SSH_PASS=sshflavioia
SOCKS_PORT=9050
HTTP_PROXY_PORT=8118
```

### 3. Configurar networking

- Certifique-se de que o container está na mesma rede do `uscall-scraper`
- No EasyPanel, os containers no mesmo projeto compartilham a rede automaticamente

### 4. Configurar o uscall-scraper

No `uscall-scraper`, adicione:

```bash
# REMOVER ESTAS (não funciona em rede bridge):
# SSH_ENABLED=false
# SSH_HOST=...
# SSH_PORT=...

# ADICIONAR ESTAS:
HTTP_PROXY=http://ssh-tunnel-sidecar:8118
HTTPS_PROXY=http://ssh-tunnel-sidecar:8118
```

## ✅ Validação

O container exibe logs assim:

```
🚀 Iniciando SSH Tunnel Sidecar...
📡 Configuração:
   SSH: flavio@192.168.192.164:22
   SOCKS Port: 9050
   HTTP Proxy Port: 8118
🔧 Configurando Privoxy...
▶️  Iniciando Privoxy...
✅ Privoxy rodando (PID: 123)
🔍 Testando conectividade SSH...
SSH OK
✅ Conectividade SSH OK
🔗 Iniciando túnel SSH...
   Mantendo conexão ativa...
[2025-12-28 03:00:00] Conectando túnel SSH...
```

## 🧪 Testar do uscall-scraper

```bash
# Dentro do container uscall-scraper:
curl -x http://ssh-tunnel-sidecar:8118 https://uscall2.opennew.com.br
```

## 🔧 Troubleshooting

### Túnel desconecta

Normal. O script reconecta automaticamente a cada 5 segundos.

### "Connection refused"

- Verifique se o ZeroTier está ativo no HOST do EasyPanel
- Teste: `zerotier-cli listnetworks` no VPS

### "Permission denied"

- Verifique SSH_PASS
- Teste: `ssh flavio@192.168.192.164` no VPS

## 📝 Commits

- Para committar alterações, o projeto segue o padrão do repositório principal

---

**Mantido por**: Flávio Muniz  
**Projeto**: Sistema de Monitoramento Clinfec
