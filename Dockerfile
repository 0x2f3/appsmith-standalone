# Appsmith — wrapper sobre a imagem oficial publicada pelo projeto.
#
# A imagem appsmith/appsmith-ce (Docker Hub) já empacota o app completo
# (nginx + backend Java + frontend React):
#   - Porta 80 (EXPOSE) — nginx serve o web app e proxya /api pro backend
#   - Mongo + Redis EMBUTIDOS em /appsmith-stacks (volume) — zero serviços extras
#   - Healthcheck nativo em /api/v1/health
#
# Não rebuildamos o app: o upstream publica imagem estável (tags semver,
# ex: v1.77.0). Pino explícito = deploys reproduzíveis.
# Pra atualizar: bump da tag abaixo e re-deploy.
FROM appsmith/appsmith-ce:v1.77.0

# EXPOSE explícito é OBRIGATÓRIO: o Railway detecta a porta do serviço pelo
# EXPOSE do Dockerfile (não herda da imagem base via FROM).
EXPOSE 80

# ⚠️ VOLUME: montar /appsmith-stacks (Mongo + Redis + uploads). Sem volume,
# os dados morrem a cada redeploy. Adicionar volume no dashboard do projeto.
