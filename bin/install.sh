#!/usr/bin/env bash

echo """
#!/usr/bin/env bash
BASEDIR="$(dirname "$PWD")"
echo Resetting postgis workspace
docker-compose -f \${BASEDIR}/docker-compose.yml down
docker volume rm postgis_workspace_database-volume
docker-compose -f \${BASEDIR}/docker-compose.yml up \$1
""" > /usr/local/bin/pgis_ws_reset.sh

chmod +x /usr/local/bin/pgis_ws_reset.sh


echo """
#!/usr/bin/env bash


OLD_DIR=\${PWD}

SYMLINK_SQL_DIR=${PWD}/db_init

MIGDIR=\"\$(cd \"\$(dirname \"\$1\")\"; pwd)/\$(basename \"\$1\")\"

if [ -L \${SYMLINK_SQL_DIR} ]; then  echo "Overriding present settings"; rm \${SYMLINK_SQL_DIR}; fi
cd ${PWD}

ln -s \${MIGDIR}/ db_init

cd \${OLD_DIR}
echo \"Postgis workspace sql source was set to \${MIGDIR}\"
""" > /usr/local/bin/pgis_ws_set_init_path.sh

chmod +x /usr/local/bin/pgis_ws_set_init_path.sh


echo """
#!/usr/bin/env bash
BASEDIR="$(dirname "$PWD")"
echo *** Shutting down postgis workspace ***
docker-compose -f \${BASEDIR}/docker-compose.yml down
""" > /usr/local/bin/pgis_ws_stop.sh

chmod +x /usr/local/bin/pgis_ws_stop.sh