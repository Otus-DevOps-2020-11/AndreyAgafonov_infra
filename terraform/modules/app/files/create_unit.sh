#!/bin/bash

cat <<EOF>/etc/systemd/system/otus.service
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=fork
#WatchdogSec=10
PIDFile=/var/run/puma.pid
WorkingDirectory=/opt/reddit
ExecStart=/usr/local/bin/puma
# Variant: Rails start.
# ExecStart=/<FULLPATH>/bin/puma -C <YOUR_APP_PATH>/config/puma.rb ../config.ru
Restart=always
Environment=DATABASE_URL
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start otus.service
systemctl enable otus.service
