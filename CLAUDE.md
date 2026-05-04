<!--
  =====================================================================
  GRAPHIFY - Bloco de instrucoes obrigatorias (gerado automaticamente)
  Colocado AQUI NO TOPO para que o Claude.ai web siga sem dica adicional.
  Workflow .github/workflows/graphify.yml mantem o grafo atualizado.
  =====================================================================
-->

# CLAUDE.md - Instrucoes Mestras

> **VOCE (Claude) DEVE LER ESTE ARQUIVO INTEIRO ANTES DE FAZER QUALQUER COISA.**
> **Em seguida, OBRIGATORIAMENTE consultar os arquivos listados abaixo.**

## ZERO. PROTOCOLO DE ATIVACAO (executar SEMPRE no inicio da conversa)

Voce DEVE ler nesta ordem antes de responder o usuario:

1. **Este CLAUDE.md inteiro** (regras, contexto, conhecimento)
2. **`graphify-out/GRAPH_REPORT.md`** - mapa do codigo (God Nodes, Communities, conexoes)
3. **`graphify-out/manifest.json`** - lista de arquivos analisados
4. **`.claude/skills.md`** - skills aplicaveis a este projeto
5. **(opcional) `graphify-out/graph.json`** - grafo estruturado para localizar simbolos

So abra outros arquivos APOS consultar o grafo. Use `graph.json` como indice. Nunca varra a arvore de arquivos.

Se algum desses arquivos nao existir, AVISE o usuario que o repo precisa rodar
o workflow Graphify ou que o grafo esta defasado.

## ZERO.1 PROTOCOLO DE EXCELENCIA (sempre vale)

- **Tudo e importante**: nao julgar prioridades. Ordenar so por dependencia tecnica.
- **Nada parcial**: completar 100% antes de seguir. Nada de "principal primeiro".
- **Nao perguntar no meio**: seguir ate o final, relatar erros e tratar imediatamente.
- **Microsprints**: 1 detalhe = 1 sprint. PDCA a cada ciclo de 5-10 sprints.
- **Testes completos**: testar cada campo, botao, rota, link individualmente.
- **PT-BR obrigatorio**: variaveis, comentarios, mensagens, commits em portugues.
- **UTF-8 + timezone America/Sao_Paulo**.
- **Validacoes Brasil quando aplicavel**: CPF, CNPJ, CEP, telefone.
- **LGPD prioritaria** para dados pessoais.
- **Versionamento**: SemVer (MAJOR.MINOR.PATCH) atualizado em todos os locais.
- **Documentacao continua**: atualizar este CLAUDE.md ao final de cada sessao.
- **GitHub + deploy**: commit + push + deploy + validacao final em producao.

## ZERO.2 SKILLS APLICAVEIS

Veja `.claude/skills.md` para a lista completa. Resumo basal (sempre validas):
`excelencia-total`, `scrum-microsprints`, `documentacao-continua`,
`versionamento-sistema`, `testes-completos`. Skills condicionais e
tecnologia-especificas listadas em `.claude/skills.md`.

---

## 1. IDENTIDADE DO PROJETO

- **Repositorio:** `fmunizmcorp/ssh-tunnel-sidecar`
- **Descricao:** SSH Tunnel Sidecar para acesso a recursos via ZeroTier
- **Tamanho:** ~3 KB
- **Skill stack:** generico
- **Visualizacao:** `graphify-out/graph.html` e `graphify-out/GRAPH_TREE.html`

## 4. CONTEXTO DO PROJETO (extraido do README)

# ð SSH Tunnel Sidecar

Container sidecar que cria um tÃºnel SSH com proxy HTTP para permitir que outros containers acessem recursos atravÃ©s de uma rede ZeroTier privada.

## ð¯ Problema que Resolve

O EasyPanel roda containers em rede bridge, que nÃ£o tÃªm acesso Ã  rede ZeroTier do host. Este sidecar resolve isso criando um tÃºnel SSH que outros containers podem usar como proxy.

## ðï¸ Arquitetura

```
[Container App] 
    â HTTP Proxy (http://ssh-tunnel:8118)
[SSH Tunnel Sidecar]
    â SOCKS5 (localhost:9050)
[SSH Tunnel] 
    â ZeroTier Network
[Servidor Privado 192.168.192.164]
    â
[USCall https://uscall2.opennew.com.br]
```

## ð Como Usar no EasyPanel

### 1. Criar novo projeto no EasyPanel

1. Nome: `ssh-tunnel-sidecar`
2. Tipo: Docker
3. Repository: (este repo)
4. Build Context: `.`

### 2. Configurar variÃ¡veis de ambiente

```bash
SSH_HOST=192.168.192.164
SSH_PORT=22
SSH_USER=flavio
SSH_PASS=sshflavioia
SOCKS_PORT=9050
HTTP_PROXY_PORT=8118
```

### 3. Configurar networking

- Certifique-se de que o container estÃ¡ na mesma rede do `uscall-scraper`
- No EasyPanel, os containers no mesmo projeto compartilham a rede automaticamente

### 4. Configurar o uscall-scraper

No `uscall-scraper`, adicione:

```bash
# REMOVER ESTAS (nÃ£o funciona em rede bridge):
# SSH_ENABLED=false
# SSH_HOST=...
# SSH_PORT=...

# ADICIONAR ESTAS:
HTTP_PROXY=http://ssh-tunnel-sidecar:8118
HTTPS_PROXY=http://ssh-tunnel-sidecar:8118
```

## â ValidaÃ§Ã£o

O container exibe logs assim:

```
ð Iniciando SSH Tunnel Sidecar...
ð¡ ConfiguraÃ§Ã£o:
   SSH: flavio@192.168.192.164:22
   SOCKS Port: 9050
   HTTP Proxy Port: 8118
ð§ Configurando Privoxy...
â¶ï¸  Iniciando Privoxy...
â Privoxy rodando (PID: 123)
ð Testando conectividade SSH...
SSH OK
â Conectividade SSH OK
ð Iniciando tÃºnel SSH...
   Mantendo conexÃ£o ativa...
[2025-12-28 03:00:00] Conectando tÃºnel SSH...
```

## ð§ª Testar do uscall-scraper

```bash
# Dentro do container uscall-scraper:
curl -x http://ssh-tunnel-sidecar:8118 https://uscall2.opennew.com.br
```

## ð§ Troubleshooting

### TÃºnel desconecta

Normal. O script reconecta automaticamente a cada 5 segundos.

### "Connection refused"

- Verifique se o ZeroTier estÃ¡ ativo no HOST do EasyPanel
- Teste: `zerotier-cli listnetworks` no VPS

### "Permission denied"

- Verifique SSH_PASS
- Teste: `ssh flavio@192.168.192.164` no VPS

## ð Commits

- Para committar alteraÃ§Ãµes, o projeto segue o padrÃ£o do repositÃ³rio principal

---

**Mantido por**: FlÃ¡vio Muniz  
**Projeto**: Sistema de Monitoramento Clinfec

## 6. ESTRUTURA DA RAIZ

```
.claude
.github
.gitignore
CLAUDE.md
Dockerfile
README.md
privoxy-config.txt
start-tunnel.sh
```

---

## ENTREGA OBRIGATORIA AO FINAL DE CADA TAREFA

- [ ] Codigo completo (nao so a parte principal)
- [ ] Testes executados em cada detalhe
- [ ] Este CLAUDE.md atualizado com aprendizados
- [ ] CHANGELOG ou docs atualizados
- [ ] Versao incrementada em todos os locais (SemVer)
- [ ] commit + push para GitHub
- [ ] Deploy em producao executado
- [ ] Validacao final em producao
- [ ] Grafo Graphify regenerado (workflow automatico cuida)

---

> **Versao deste CLAUDE.md:** v2 - Graphify integrado em 2026-05-04
> **Mantido por:** workflow .github/workflows/graphify.yml + edicao manual quando necessario
