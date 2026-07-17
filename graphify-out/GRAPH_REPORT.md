# Graph Report - ssh-tunnel-sidecar  (2026-07-17)

## Corpus Check
- 8 files · ~4,113 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 46 nodes · 25 edges · 22 communities (5 shown, 17 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `ee5839bc`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- Squad sob sua coordenacao
- code:block4 (.claude)
- code:block1 (Trabalhando em fmunizmcorp/ssh-tunnel-sidecar. Como Engenhei)
- code:block2 (Feature nova em fmunizmcorp/ssh-tunnel-sidecar: <DESCRICAO>)
- code:bash (SSH_HOST=192.168.192.164)
- start-tunnel.sh
- Aprendizados - fmunizmcorp/ssh-tunnel-sidecar
- Historico de Sessoes - fmunizmcorp/ssh-tunnel-sidecar
- Orquestrador - fmunizmcorp/ssh-tunnel-sidecar
- Skills aplicaveis (Shell / Outros)
- code:block3 (Bug em fmunizmcorp/ssh-tunnel-sidecar: <DESCRICAO + STACK TR)
- code:block4 (Auditoria em fmunizmcorp/ssh-tunnel-sidecar: <ESCOPO>)
- code:block5 (Deploy em fmunizmcorp/ssh-tunnel-sidecar: versao <X.Y.Z>)
- code:block6 (Descobri novo padrao em fmunizmcorp/ssh-tunnel-sidecar que v)
- code:block1 ([Container App])
- code:bash (SSH_HOST=192.168.192.164)
- code:bash (# REMOVER ESTAS (no funciona em rede bridge):)
- code:block5 (.gitignore)
- code:block1 ([Container App])
- code:bash (# REMOVER ESTAS (não funciona em rede bridge):)
- code:block4 (🚀 Iniciando SSH Tunnel Sidecar...)
- code:bash (# Dentro do container uscall-scraper:)

## God Nodes (most connected - your core abstractions)
1. `Orquestrador - fmunizmcorp/ssh-tunnel-sidecar` - 10 edges
2. `Squad sob sua coordenacao` - 3 edges
3. `Skills aplicaveis (Shell / Outros)` - 3 edges
4. `Aprendizados - fmunizmcorp/ssh-tunnel-sidecar` - 3 edges
5. `Historico de Sessoes - fmunizmcorp/ssh-tunnel-sidecar` - 3 edges
6. `Aprendizados` - 2 edges
7. `Historico` - 2 edges
8. `start-tunnel.sh script` - 1 edges
9. `SSHPASS` - 1 edges
10. `Persona` - 1 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Import Cycles
- None detected.

## Communities (22 total, 17 thin omitted)

### Community 0 - "Squad sob sua coordenacao"
Cohesion: 0.67
Nodes (3): Especialistas deste projeto, Sempre disponiveis (basais), Squad sob sua coordenacao

### Community 8 - "Aprendizados - fmunizmcorp/ssh-tunnel-sidecar"
Cohesion: 0.40
Nodes (4): Aprendizados, Aprendizados - fmunizmcorp/ssh-tunnel-sidecar, Como usar, YYYY-MM-DD - Titulo do aprendizado [#categoria]

### Community 9 - "Historico de Sessoes - fmunizmcorp/ssh-tunnel-sidecar"
Cohesion: 0.40
Nodes (4): Como usar, Historico, Historico de Sessoes - fmunizmcorp/ssh-tunnel-sidecar, YYYY-MM-DD - vX.Y.Z - Titulo da sessao

### Community 11 - "Orquestrador - fmunizmcorp/ssh-tunnel-sidecar"
Cohesion: 0.20
Nodes (9): Criticidade, Decisoes que NAO sao suas, Decisoes que voce (orquestrador) toma, Dominio de atuacao, Missao, Orquestrador - fmunizmcorp/ssh-tunnel-sidecar, Persona, Stack (+1 more)

### Community 12 - "Skills aplicaveis (Shell / Outros)"
Cohesion: 0.50
Nodes (3): Basais (sempre), Padroes, Skills aplicaveis (Shell / Outros)

## Knowledge Gaps
- **34 isolated node(s):** `start-tunnel.sh script`, `SSHPASS`, `Persona`, `Missao`, `Dominio de atuacao` (+29 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **17 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Orquestrador - fmunizmcorp/ssh-tunnel-sidecar` connect `Orquestrador - fmunizmcorp/ssh-tunnel-sidecar` to `Squad sob sua coordenacao`?**
  _High betweenness centrality (0.064) - this node is a cross-community bridge._
- **Why does `Squad sob sua coordenacao` connect `Squad sob sua coordenacao` to `Orquestrador - fmunizmcorp/ssh-tunnel-sidecar`?**
  _High betweenness centrality (0.021) - this node is a cross-community bridge._
- **What connects `start-tunnel.sh script`, `SSHPASS`, `Persona` to the rest of the system?**
  _34 weakly-connected nodes found - possible documentation gaps or missing edges._