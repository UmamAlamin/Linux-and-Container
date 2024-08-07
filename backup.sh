#!/bin/bash

# Set variables
TIMESTAMP=$(date +"%y%m%d")
BACKUP_DIR="/mnt/c/Users/umam/Desktop/backup"
DOCKER_CONTAINER="postgres_container"
DB_USER="postgres"
BACKUP_FILE="postgres_backup_${TIMESTAMP}.sql"

# Debug information
echo "Current directory: $(pwd)"
echo "Backup directory: $BACKUP_DIR"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Check if directory was created
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Failed to create backup directory"
    exit 1
fi

# Run pg_dumpall inside the Docker container
echo "Running pg_dumpall..."
docker exec -t $DOCKER_CONTAINER pg_dumpall -c -U $DB_USER > "$BACKUP_DIR/$BACKUP_FILE"

# Check if backup file was created
if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo "Failed to create backup file"
    exit 1
fi

# Compress the backup file
echo "Compressing backup file..."
gzip "$BACKUP_DIR/$BACKUP_FILE"

echo "Backup completed: $BACKUP_DIR/${BACKUP_FILE}.gz"