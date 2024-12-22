#!/bin/bash

# the directory containing this script
DOTFILES_DIR="$HOME/.dotfiles"

# the directory to back up old files to
BACKUP_DIR="$HOME/backups"

# the directory to symlink files to
CONFIG_DIR="$HOME/.config"

# files to go in the .config directory
CONFIG_DIR_FILES=("nvim")

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
fi

# backups old files to a backup directory if they exist
backup_old_file() {
    local old_file="$1"
    local target_dir="$2"

    if [ -e "$target_dir/$(basename "$old_file")" ]; then
        local backup_file="$BACKUP_DIR/$(basename "$old_file")"
        echo "Backing up $old_file to $backup_file"
        cp -r "$old_file" "$backup_file"
    fi
}

symlink_file() {
    local source_file="$1"
    local target_dir="$2"

    backup_old_file "$source_file" "$target_dir"

    echo "Symlinking $source_file to $target_dir"
    ln -sf "$source_file" "$target_dir"
}

# add files to the .config directory
for file in "${CONFIG_DIR_FILES[@]}"; do
    echo "Adding $file to $CONFIG_DIR"
    symlink_file "$DOTFILES_DIR/$file" "$CONFIG_DIR/$file"
done
