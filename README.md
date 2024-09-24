# Docker Klondike

![Docker Pulls](https://img.shields.io/docker/pulls/hudsonm62/docker-klondike)

Unofficial Docker image for [chriseldredge/Klondike](https://github.com/chriseldredge/Klondike) running on [Alpine](https://www.alpinelinux.org/) using [Mono](http://mono-project.com/).

## Usage

- See [Settings.config](https://github.com/chriseldredge/Klondike/blob/master/src/Klondike.WebHost/Settings.config) and [Web.config](https://github.com/chriseldredge/Klondike/blob/master/src/Klondike.WebHost/Web.config) for configuration.

### Basic

```txt
docker run -it -d -p 8080:8080 hudsonm62/docker-klondike
```

### Full

```txt
docker run -it -d \
           -p 8080:8080 \
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
      - /path/to/Settings.config:/app/Settings.config
      - /path/to/Web.config:/app/Web.config
```
