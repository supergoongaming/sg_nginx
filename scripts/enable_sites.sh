#! /bin/sh
# Enable all the sites that we want to work.
filenames='sgdiscord_supergoon_com.conf wedding_supergoon_com.conf root_supergoon_com.conf'
for name in $filenames; do
    ln -s "/etc/nginx/sites_available/$name" "/etc/nginx/sites_enabled/$name"
done