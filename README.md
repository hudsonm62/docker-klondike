# Docker Klondike

![Docker Pulls](https://img.shields.io/docker/pulls/hudsonm62/docker-klondike)

Unofficial Docker image for [chriseldredge/Klondike](https://github.com/chriseldredge/Klondike) running on [Alpine](https://www.alpinelinux.org/) using [Mono](http://mono-project.com/).

## Tags

- `alpine-20`
- `v1`

## Usage

- See [Settings.config](https://github.com/chriseldredge/Klondike/blob/master/src/Klondike.WebHost/Settings.config) and [Web.config](https://github.com/chriseldredge/Klondike/blob/master/src/Klondike.WebHost/Web.config) for configuration.

### Basic

```txt
docker run -it -d -p 8080:8080 \
           -v /path/to/App_Data:/app/App_Data
           hudsonm62/docker-klondike
```

### Full

```txt
docker run -it -d \
           -p 8080:8080 \
           -v /path/to/App_Data:/app/App_Data \
           -v /path/to/Settings.config:/app/Settings.config \
           -v /path/to/Web.config:/app/Web.config \
           hudsonm62/docker-klondike
```

#### Docker Compose

```yml
services:
  klondike:
    image: hudsonm62/docker-klondike
    ports:
      - "8080:8080"
    volumes:
      - /path/to/App_Data:/app/App_Data
      - /path/to/Settings.config:/app/Settings.config
      - /path/to/Web.config:/app/Web.config
```
