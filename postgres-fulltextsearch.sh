#!/bin/bash

POSTGRE_SEARCH_DIR="/usr/share/postgresql/$PG_MAJOR/tsearch_data"
whoami
ls -la $POSTGRE_SEARCH_DIR
#Unzip dictionary
#cp /temp/ru_ru.affix "$POSTGRE_SEARCH_DIR/"
#cp /temp/ru_ru.dict "$POSTGRE_SEARCH_DIR/"


#Default search setup
echo "Change postgresql.conf"
cp "$PGDATA/postgresql.conf" "$PGDATA/postgresql.conf.backup-$(date +%d.%m.%Y-%H:%M)"
sed --in-place 's/default_text_search_config/#default_text_search_config/g' "$PGDATA/postgresql.conf"
echo "default_text_search_config = 'ru'" >> "$PGDATA/postgresql.conf"
/etc/init.d/postgresql restart
echo "Done!"
