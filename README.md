<!-- 
  ============================================================
  mtproto-proxy-server
  ============================================================
-->

<p align="center">
  <img src="https://img.shields.io/github/stars/tstas69-spec/mtproto-proxy-server?style=for-the-badge&color=yellow" alt="Stars">
  <img src="https://img.shields.io/badge/Docker-ready-blue?style=for-the-badge" alt="Docker">
  <img src="https://img.shields.io/badge/Ubuntu-20.04%20%7C%2022.04-orange?style=for-the-badge" alt="Ubuntu">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License">
</p>

<h1>3 шага: прокси сервер MTProto для Telegram</h1>

<p align="center">
  <strong>Прокси сервер MTProto для Телеграмма — готовый пример установки и подключения MTProto proxy на собственном VPS.</strong><br>
  <strong>Прокси сервер для телеграмм. Установка прокси за одну команду.</strong>
</p>

<p align="center">
  <a href="#en"><img src="https://flagcdn.com/gb.svg" width="30" alt="English"> English</a>
</p>

### 🚀 Установка одной командой

Подключитесь к VPS по SSH и выполните:

```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tstas69-spec/mtproto-proxy-server/main/install.sh)"
```

Скрипт автоматически установит необходимые компоненты, откроет порт 443, запустит MTProto proxy и выведет готовую ссылку для подключения Telegram.

<p>
  <a href="https://tstas69-spec.github.io/" target="_blank" rel="noopener noreferrer">
    📖 Полная инструкция по установке и подключению MTProto proxy
  </a>
</p>

---

## 1. Прокси сервер MTProto для Telegram

**Прокси сервер MTProto для Telegram** — это сервер на VPS, который используется для подключения Telegram-клиента через MTProto proxy.

Этот репозиторий содержит рабочий пример с готовым `install.sh`. Вместо ручной установки Docker, настройки firewall и запуска контейнера достаточно выполнить одну команду.

Проект рассчитан на простой сценарий:

```text
VPS
 │
 ├── Ubuntu 20.04 / 22.04
 │
 ├── Docker
 │
 ├── MTProto proxy
 │
 └── порт 443
```

После установки скрипт выводит параметры, необходимые для подключения Telegram.

---

## 2. Требования к VPS

Для запуска прокси сервера достаточно минимального VPS:

* **Ubuntu 20.04 или 22.04**
* **1 CPU core**
* **512 MB RAM**
* открытый **порт 443**
* доступ по **SSH**
* root или пользователь с `sudo`

Для постоянной работы рекомендуется VPS с выделенным IPv4 и стабильным сетевым соединением.

### Локация и оплата VPS

Для сервера можно выбрать европейскую локацию.

Доступность VPS-провайдеров и способы оплаты отличаются в зависимости от страны. Пользователям из России, Китая и арабских стран перед заказом следует проверить актуальные варианты оплаты конкретного провайдера.

В полной инструкции приведён пример подходящего VPS-провайдера и описаны основные параметры выбора сервера.

<p>
  <a href="https://tstas69-spec.github.io/" target="_blank" rel="noopener noreferrer">
    👉 Выбор VPS и полная инструкция по установке MTProto proxy
  </a>
</p>

---

## 3. Установка прокси сервера одной командой

После подключения к Ubuntu VPS выполните:

```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tstas69-spec/mtproto-proxy-server/main/install.sh)"
```

Ручная установка Docker и настройка firewall не требуются.

### Что делает `install.sh`

Скрипт автоматически:

1. Обновляет систему;
2. Устанавливает Docker;
3. Устанавливает и настраивает `ufw`;
4. Уткрывает порт **443**;
5. Запускает MTProto proxy;
6. Использует Docker-образ `nineseconds/mtg:2`;
7. Настраивает Fake TLS;
8. Генерирует secret;
9. Выводит готовую ссылку для Telegram.

После завершения установки дополнительных действий на сервере обычно не требуется.

---

## 4. MTProto прокси для телеграмм подключить

Если стоит задача — **MTProto прокси для телеграмм подключить**, весь процесс состоит из нескольких шагов:

1. Выбрать VPS;
2. Установить Ubuntu 20.04 или 22.04;
3. Подключиться к серверу по SSH;
4. Выполнить команду `install.sh`;
5. Дождаться окончания установки;
6. Получить ссылку `tg://proxy`;
7. Открыть её в Telegram.

После установки скрипт выводит ссылку примерно такого вида:

```text
tg://proxy?server=IP&port=443&secret=КЛЮЧ
```

Скопируйте её и откройте на устройстве с Telegram.

<p>
  <a href="https://tstas69-spec.github.io/" target="_blank" rel="noopener noreferrer">
    📖 Подробная инструкция: как установить и подключить MTProto proxy
  </a>
</p>

---

## 5. Прокси сервер для Телеграмм

**Прокси сервер для Телеграмм** в данном проекте запускается на собственном VPS и работает через MTProto.

После выполнения `install.sh` сервер получает:

* IP-адрес VPS;
* порт `443`;
* secret;
* готовую ссылку `tg://proxy`.

Ссылка позволяет передать параметры подключения Telegram-клиенту без ручного ввода каждого значения.

### Подключение вручную

Если используется ручной способ, понадобятся:

```text
Server: IP-адрес VPS
Port: 443
Secret: сгенерированный install.sh ключ
```

Эти параметры используются для настройки MTProto proxy в Telegram.

---

## 6. Что находится в репозитории

Структура проекта:

```text
mtproto-proxy-server/
├── install.sh
└── README.md
```

Главный файл — `install.sh`.

Он объединяет установку необходимых компонентов и запуск MTProto proxy в один сценарий.

Репозиторий можно использовать как готовый пример **MTProto server / MTProto proxy** и как основу для собственной конфигурации.

---

## 7. Как работает MTProto proxy

Упрощённая схема:

```text
Telegram
   │
   │ MTProto
   ▼
┌───────────────┐
│      VPS      │
│               │
│ MTProto Proxy │
└───────┬───────┘
        │
        ▼
Telegram infrastructure
```

MTProto proxy принимает соединение Telegram-клиента и передаёт его дальше через инфраструктуру Telegram.

В этом проекте используется Docker-образ `nineseconds/mtg:2`.

---

## 8. Быстрый старт

Весь процесс можно свести к одной команде:

```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/tstas69-spec/mtproto-proxy-server/main/install.sh)"
```

После выполнения:

1. Дождитесь завершения установки;
2. Сохраните выведенную ссылку `tg://proxy`;
3. Откройте её в Telegram;
4. Подтвердите подключение.

<p>
  <a href="https://tstas69-spec.github.io/" target="_blank" rel="noopener noreferrer">
    📖 Открыть полную инструкцию по MTProto server и Telegram proxy
  </a>
</p>

---

## 9. Частые вопросы

### Какой VPS нужен для MTProto proxy?

Минимальная конфигурация — **1 CPU, 512 MB RAM, Ubuntu 20.04 или 22.04 и открытый порт 443**.

### Нужен ли Docker?

Да. Но устанавливать его вручную не требуется — `install.sh` устанавливает Docker автоматически.

### Нужно ли вручную настраивать firewall?

Нет. Скрипт устанавливает `ufw` и открывает порт 443.

### Как получить ссылку для Telegram?

После установки `install.sh` автоматически генерирует secret и выводит ссылку формата:

```text
tg://proxy?server=IP&port=443&secret=КЛЮЧ
```

### Где находится подробная инструкция?

<p>
  <a href="https://tstas69-spec.github.io/" target="_blank" rel="noopener noreferrer">
    Полная инструкция по установке, настройке VPS и подключению MTProto proxy
  </a>
</p>

---

## 10. Другие языковые версии

Международная версия проекта содержит материалы на других языках:

<p>
  <a href="https://github.com/tstas69-spec/mtproto-server-example#english">
    🇬🇧 English
  </a>
  •
  <a href="https://github.com/tstas69-spec/mtproto-server-example#chinese">
    🇨🇳 中文
  </a>
  •
  <a href="https://github.com/tstas69-spec/mtproto-server-example#arabic">
    🇸🇦 العربية
  </a>
  •
  <a href="https://github.com/tstas69-spec/mtproto-server-example#persian">
    🇮🇷 فارسی
  </a>
</p>

<a id="en"></a>

The international MTProto Server Example repository contains English, Chinese, Arabic and Persian versions of the documentation.

👉 <a href="https://github.com/tstas69-spec/mtproto-server-example" target="_blank" rel="noopener noreferrer">MTProto Server Example — international version</a>

---

<p align="center">
  <b>⭐ Поставьте звезду, если репозиторий помог!</b>
</p>

<p align="center">
  <a href="https://tstas69-spec.github.io/">
    <img src="https://img.shields.io/badge/📖_Full_Guide-tstas69--spec.github.io-blue?style=for-the-badge" alt="Full Guide">
  </a>
</p>
