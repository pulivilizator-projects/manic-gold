#!/bin/sh
# Выкладывает ветку на тестовый сайт SourceCraft: https://dmitriy-dmgora.sourcecraft.site/manic-gold-test/
# Использование: ./staging.sh [ветка]   (по умолчанию — текущая)
# Тестовая копия закрыта от поисковиков (robots.txt + noindex) и не шлёт данные в Метрику.
set -eu
BRANCH=${1:-$(git rev-parse --abbrev-ref HEAD)}
REMOTE=${REMOTE:-ssh://ssh.sourcecraft.dev/dmitriy-dmgora/manic-gold-test.git}
TMP=$(mktemp -d)
trap 'git worktree remove --force "$TMP" >/dev/null 2>&1 || true' EXIT

git worktree add --detach "$TMP" "$BRANCH" >/dev/null
cd "$TMP"
printf 'User-agent: *\nDisallow: /\n' > robots.txt
mkdir -p .sourcecraft && printf 'site:\n  ref: main\n' > .sourcecraft/sites.yaml
sed -i.bak 's|<meta charset="utf-8">|<meta charset="utf-8">\n<meta name="robots" content="noindex, nofollow">|' index.html privacy.html
sed -i.bak 's|  function load() {|  function load() { return;|' index.html
rm -f ./*.bak
grep -q 'content="noindex, nofollow"' index.html
grep -q 'function load() { return;' index.html
git add -A
git -c user.name=staging -c user.email=staging@localhost commit -qm "staging: noindex, без Метрики ($BRANCH)"
git push -qf "$REMOTE" HEAD:refs/heads/main
echo "Выложено: $BRANCH -> https://dmitriy-dmgora.sourcecraft.site/manic-gold-test/"
