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
  --allow-root
chown -R www-data:www-data wp-content
chmod -R g+w wp-content
