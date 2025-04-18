# Docker container for running PHP 5.6.40 in an isolated environment

This docker container can be used to start isolating a PHP5 application.

## Usage

### Docker

```sh
docker run \
-v ./web:/var/www/html/ \
# If you want to change the web server config (Youll find a sample here in the repository, see config folder):
-v ./etc/apache2/httpd.conf:/etc/apache2/apache2.conf \
# If you want to change the php.ini (Youll find a sample here in the repository, see config folder)
-v ./etc/php5/php.ini:/usr/local/etc/php/php.ini \
hobart2967/docker-apache2-php5.6.40
```

### Docker Compose
```yaml
services:
  web:
    build: hobart2967/apache2-php5.6.40:latest
    volumes:
      - ./httpdocs:/var/www/html
      # If you want to change the web server config (Youll find a sample here in the repository, see config folder):
      #- ./etc/apache2/httpd.conf:/etc/apache2/apache2.conf

      # If you want to change the php.ini (Youll find a sample here in the repository, see config folder)
      #- ./etc/php5/php.ini:/usr/local/etc/php/php.ini
```