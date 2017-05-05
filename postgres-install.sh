#!/bin/bash

sed -i -e "s/max_connections = 100/max_connections = 9999/g" "$PGDATA/postgresql.conf"
sed -i -e "s/#work_mem = 4MB/work_mem = 200MB/g" "$PGDATA/postgresql.conf"

