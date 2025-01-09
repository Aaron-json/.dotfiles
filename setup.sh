#!/bin/bash

# the directory to back up old files to
BACKUP_DIR="$HOME/backups"

# the directory to symlink files to
CONFIG_DIR="$HOME/.config"

# dotfiles dir containing the files to symlink
DOTFILES_DIR="$(realpath .)"

# files to go in the .config directory
CONFIG_DIR_FILES=("nvim" "wezterm")

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
fi

# backups old files to a backup directory if they exist
backup_old_file() {
    local source_file="$1"
    local target_dir="$2"

    # check if the target directory already contains a file with the same name and back it up.
    if [ -e "$target_dir/$(basename "$source_file")" ]; then
        local backup_path="$BACKUP_DIR/$(basename "$source_file")"
        echo "Backing up $source_file to $backup_path"
        cp -rf "$source_file" "$backup_path"
    fi
}

symlink_file() {
    local source_file="$1"
    local target_dir="$2"

    backup_old_file "$source_file" "$target_dir"

    echo "Symlinking $source_file to $target_dir"
    ln -sf "$source_file" "$target_dir/$(basename "$source_file")"
}

# add files to the .config directory
for file in "${CONFIG_DIR_FILES[@]}"; do
    symlink_file "$DOTFILES_DIR/$file" "$CONFIG_DIR"
done

# add aliases to the .bashrc file
echo "Adding aliases to .bashrc"
cat ./aliases.sh >> $HOME/.bashrc
