#!/usr/bin/env bash
# NGINX setup commands I ran on the Rocky Linux host.
# Reproduces the build end-to-end from a fresh Rocky Minimal install.
set -euo pipefail

# 1. Install NGINX from the default Rocky repo and enable it on boot.
sudo dnf install -y nginx
sudo systemctl enable --now nginx

# 2. Open the firewall for HTTP and HTTPS.
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# 3. Create the three content directories.
sudo mkdir -p /usr/share/nginx/oakomolafe6433HQ \
              /usr/share/nginx/oakomolafe6433Logo \
              /usr/share/nginx/oakomolafe6433Music

# 4. Drop a minimal index.html into each (real content would replace these).
sudo tee /usr/share/nginx/oakomolafe6433HQ/index.html >/dev/null <<'EOF'
<h1>oakomolafe6433 LinuxWebServer Final</h1>
<p>This is my Linux NGINX site.</p>
EOF
sudo tee /usr/share/nginx/oakomolafe6433Logo/index.html >/dev/null <<'EOF'
<h1>Logo — oakomolafe6433</h1>
<p>Corporate logo site.</p>
EOF
sudo tee /usr/share/nginx/oakomolafe6433Music/index.html >/dev/null <<'EOF'
<h1>Music — oakomolafe6433</h1>
<p>Music site.</p>
EOF

# 5. Hand ownership and permissions to the nginx service account.
sudo chown -R nginx:nginx /usr/share/nginx
sudo chmod -R 755         /usr/share/nginx

# 6. Drop the site config from this repo into conf.d.
sudo cp ./condorid.conf /etc/nginx/conf.d/condorid.conf

# 7. Comment out the default server block in /etc/nginx/nginx.conf
#    (I did this by hand in the lab — see the README for details).

# 8. Validate the config, then reload.
sudo nginx -t
sudo systemctl reload nginx
