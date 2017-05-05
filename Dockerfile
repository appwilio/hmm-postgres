FROM postgres:9.6

RUN chown -R postgres:root /usr/share/postgresql/9.6/tsearch_data \
	&& chmod -R 0770 /usr/share/postgresql/9.6/tsearch_data

ADD ru_ru.affix /temp/ru_ru.affix
ADD ru_ru.dict /temp/ru_ru.dict
ADD postgres-install.sh /docker-entrypoint-initdb.d/postgres-install.sh
ADD postgres-fulltextsearch.sh /docker-entrypoint-initdb.d/postgres-fulltextsearch.sh
ADD postgres-fulltextsearch.sql /docker-entrypoint-initdb.d/postgres-fulltextsearch.sql
