
# paths
dirname=$(dirname "$(readlink -f "$0")")
lib="/usr/local/lib"
bin="/usr/local/bin"

# Copy the path
sudo cp -R $dirname "$lib/"

# remove existing bin if it exists
if [ -e "$bin/dots" ]; then
  rm "$bin/dots"
fi

# symlink dots
ln -s "$lib/dots/dots.sh" "$bin/dots"

# Ubuntu-only: Change from dash to bash
if [ "$BASH_VERSION" = '' ]; then
  sudo echo "dash    dash/sh boolean false" | debconf-set-selections ; dpkg-reconfigure --frontend=noninteractive dash
fi
