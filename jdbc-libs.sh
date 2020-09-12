#!/bin/bash

[[ -z "$STREAMSETS_LIBRARIES_EXTRA_DIR" ]] && { echo "Please specify where to store the JDBC libraries." ; exit 1; }

JDBC_STAGE_FOLDER="streamsets-datacollector-jdbc-lib"
MYSQL_BINLOG_STAGE_FOLDER="streamsets-datacollector-mysql-binlog-lib"

mkdir -p $STREAMSETS_LIBRARIES_EXTRA_DIR/{$JDBC_STAGE_FOLDER,$MYSQL_BINLOG_STAGE_FOLDER}/lib/

cp mariadb-java-client-2.6.2-javadoc.jar $STREAMSETS_LIBRARIES_EXTRA_DIR/$JDBC_STAGE_FOLDER/lib/
cp /jdbc-libs/* $STREAMSETS_LIBRARIES_EXTRA_DIR/$MYSQL_BINLOG_STAGE_FOLDER/lib/

