## Installation

```bash
git clone https://github.com/eustatos/wordpress-docker-dev-env.git
```
or, if you prefer `ssh`
```bash
git clone git@github.com:eustatos/wordpress-docker-dev-env.git
```
After
```bash
cd wordpress-docker-dev-env
docker-compose up -d
docker-compose exec -T wp-cli sh < install.sh
```
Open in browser `localhost:8080`
Default admin login - `admin`
Default admin password - `123`

You can chage this and other environment variables in `site.env` and `.env`.

Now you can modify or create content in folder `wp-content`

## Customization

If you don't want create default theme or/and plugin, you can modify
`install.sh`.
```bash
#!/usr/bin/env bash

wp core download --force --allow-root
wp config create \
  --dbhost=$WORDPRESS_DB_HOST \
  --dbname=$WORDPRESS_DB_NAME \
  --dbuser=$WORDPRESS_DB_USER \
  --dbpass=$WORDPRESS_DB_PASSWORD \
  --allow-root
wp core install \
  --title=$TITLE \
  --url=$URL \
  --admin_user=$ADMIN_USER \
  --admin_password=$ADMIN_PASSWORD \
  --admin_email=$ADMIN_EMAIL \
# add for skip creation default themes
  --skip-themes
# add for skip creation default plugins
  --skip-plugins
  --allow-root
```

Read more about `wp core install`
[here](https://developer.wordpress.org/cli/commands/core/install/)

## Example command for create content

For example, if you want to develop new theme based on `underscores`
```bash
docker-compose exec -T wp-cli wp scaffold _s \
  sample-theme \
  --theme_name="Sample Theme" \
  --author="John Doe" \
```
This command create folder `sample-theme` in `wp-content` and you can start to
develop
