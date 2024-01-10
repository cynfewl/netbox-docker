BACKUP_PATH=backup
BACKUP_DATE=$(date +"%Y-%m-%d_%H.%M.%S")
mkdir -p "${BACKUP_PATH}"
echo "${BACKUP_DATE}"
sudo /usr/bin/docker compose exec -T netbox tar c -zvf - -C /opt/netbox/netbox/media ./ > "${BACKUP_PATH}/${BACKUP_DATE}_media.tgz"
sudo /usr/bin/docker compose exec -T postgres sh -c 'pg_dump -v -Fc -c -U $POSTGRES_USER $POSTGRES_DB' > "${BACKUP_PATH}/${BACKUP_DATE}.pgdump"
