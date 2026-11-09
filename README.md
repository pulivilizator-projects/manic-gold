# Маникюр в Кимрах — Анастасия Морозова

Одностраничный сайт мастера маникюра. Статика, сайт https://magicalnails.ru/ — Timeweb Cloud App Platform, автодеплой из GitHub (ветка `main`). Копия: SourceCraft Sites (`.sourcecraft/sites.yaml`).

- `index.html` — страница (тексты, контакты, цены, SEO-теги и разметка schema.org в `<head>`)
- `photos/` — фотографии
- `vendor/`, `support.js` — рантайм анимаций

Локально: `python3 -m http.server` в этой папке и открыть http://localhost:8000.

Кнопки ВКонтакте (3 шт., `class="gf-vk"`) пока без ссылки: добавить им `href="https://vk.com/..."`, убрать `aria-disabled` и `title`, добавить ссылку в `sameAs` в JSON-LD.

При смене домена заменить адрес `https://magicalnails.ru/` в `index.html`, `robots.txt` и `sitemap.xml`.
