# Маникюр в Кимрах — Анастасия Морозова

Одностраничный сайт мастера маникюра. Статика, сайт https://magicalnails.ru/ — Timeweb Cloud App Platform, автодеплой из GitHub (ветка `main`).

- `index.html` — страница (тексты, контакты, цены, SEO-теги и разметка schema.org в `<head>`)
- `photos/` — фотографии
- `vendor/`, `support.js` — рантайм анимаций

Локально: `python3 -m http.server` в этой папке и открыть http://localhost:8000.

- `photos/works/` — фото в сетке «Работы» (номер в начале имени задаёт порядок, дальше — описание латиницей: оно попадает в Google Картинки); `photos/karusel-*` — карусель

Запись: MAX и ВКонтакте; ссылки и телефон — в `index.html` (поиск по `max.ru`, `vk.ru`, `tel:`) и в JSON-LD.

При смене домена заменить адрес `https://magicalnails.ru/` в `index.html`, `robots.txt` и `sitemap.xml`.

## Тестовый сайт

https://dmitriy-dmgora.sourcecraft.site/manic-gold-test/ — копия для проверки правок до продакшена (SourceCraft, репозиторий `dmitriy-dmgora/manic-gold-test`).

1. Правки — в отдельной ветке, не в `main` (пуш в `main` на GitHub сразу уходит на magicalnails.ru).
2. `./staging.sh` — выложить текущую ветку на тестовый сайт. Скрипт закрывает копию от поисковиков (`robots.txt` + `noindex`) и отключает Метрику; в репозиторий эти правки не попадают.
3. После проверки — слить ветку в `main` и запушить на GitHub.

Нужен SSH-ключ `~/.ssh/sourcecraft_manic_gold`, добавленный в SourceCraft (Профиль → SSH-ключи).

## IndexNow (Яндекс)

Ключ — файл `0090be1c5459e8cd6afe46acaa14e064.txt` в корне, не удалять. После выкладки изменений сообщить Яндексу:
`uv run …/yandex-seo/scripts/yandex_indexnow.py submit --host magicalnails.ru --key 0090be1c5459e8cd6afe46acaa14e064 --key-location https://magicalnails.ru/0090be1c5459e8cd6afe46acaa14e064.txt --urls https://magicalnails.ru/ --apply`
