# 🛠️ Appsmith — internal tools platform on Railway

[Appsmith](https://www.appsmith.com) — plataforma open-source pra construir internal tools, admin panels e dashboards com drag-and-drop, sem frontend. Deploy no Railway em ~3min, com Mongo + Redis embutidos (1 serviço só).

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/appsmith-standalone)

> **Nota:** publicado no marketplace — [railway.com/deploy/appsmith-standalone](https://railway.com/deploy/appsmith-standalone)

## Stack

- **Appsmith CE v1.77.0** — imagem oficial `appsmith/appsmith-ce` (Docker Hub), pinada por tag semver
- **MongoDB + Redis embutidos** — dentro de `/appsmith-stacks` (volume) — zero serviços extras
- **nginx + backend Java + frontend React** — empacotados na imagem oficial

## O que vem configurado

- ✅ **Imagem oficial pinada** — deploys reproduzíveis, sem rebuild
- ✅ **Volume `/appsmith-stacks`** — dados, apps e uploads persistem entre redeploys
- ✅ **Healthcheck nativo** em `/api/v1/health`
- ✅ **Encriptação pronta** — `APPSMITH_ENCRYPTION_PASSWORD`/`APPSMITH_ENCRYPTION_SALT` (wizard)
- ✅ **1 serviço só** — sem Postgres/Redis externo pra gerenciar

## Variáveis de ambiente

| Nome | Obrigatória | Descrição |
|------|-------------|-----------|
| `PORT` | ✅ Sim | `80` — o Railway roteia healthcheck/tráfego por essa env var |
| `APPSMITH_ENCRYPTION_PASSWORD` | ✅ Sim | Senha de criptografia (gerada no wizard) |
| `APPSMITH_ENCRYPTION_SALT` | ✅ Sim | Salt de criptografia (gerado no wizard) |

> ⚠️ **Volume obrigatório:** adicione um volume montado em `/appsmith-stacks` no serviço (Railway → service → Volumes). Sem ele, apps e dados são apagados a cada redeploy.

## Como funciona

1. O Dockerfile puxa a imagem oficial `appsmith/appsmith-ce:v1.77.0` (build ~30s)
2. O entrypoint da imagem inicializa o Mongo embutido e sobe nginx + backend
3. UI em `/`, API em `/api/*`, healthcheck `/api/v1/health`
4. Crie sua conta admin e monte os apps

## Como fazer deploy

1. Clique no botão **Deploy on Railway**
2. No wizard: `PORT=80`, `APPSMITH_ENCRYPTION_PASSWORD`/`APPSMITH_ENCRYPTION_SALT` (gerados)
3. **Adicione um volume** em `/appsmith-stacks` (Settings → Volumes)
4. Aguarde ~3min (primeiro boot inicializa o Mongo embutido)
5. Acesse a URL gerada — crie o admin em `/`

### Setup local

```bash
docker build -t appsmith-railway .
docker run -p 8080:80 -v $(pwd)/stacks:/appsmith-stacks \
  -e APPSMITH_ENCRYPTION_PASSWORD=change-me \
  -e APPSMITH_ENCRYPTION_SALT=change-me \
  appsmith-railway
# → http://localhost:8080
```

## Custo estimado no Railway

| Serviço | Tier | Custo/mês |
|---|---|---|
| Appsmith (container) | Hobby (crédito $5 inclusos) | $0 com trial |
| Volume (1GB) | Incluído no tier | $0 |
| **Total** | | **$0** até bater limites do trial |

> ⚠️ O Appsmith é um app pesado (~2GB RAM em uso com Mongo embutido). O tier Hobby cobre o trial; uso contínuo consome os créditos mensais.

## Atualizando o Appsmith

1. Veja as tags em [hub.docker.com/r/appsmith/appsmith-ce](https://hub.docker.com/r/appsmith/appsmith-ce/tags)
2. Edite a tag no `Dockerfile` (ex: `FROM appsmith/appsmith-ce:v1.78.0`)
3. Re-deploy

## Links úteis

- [Documentação](https://docs.appsmith.com) · [GitHub](https://github.com/appsmithorg/appsmith) · [Discord](https://discord.com/invite/rBTTVJp)

## Licença

Apache-2.0 (Appsmith)
