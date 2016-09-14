#!/bin/bash
set -e
rm -f vividcortex.tar.xz
rm -rf vcimage.tmptmptmp
mkdir vcimage.tmptmptmp
cd vcimage.tmptmptmp
mkdir -p usr/local/bin var/{lock,log,run}/vividcortex etc/vividcortex dev proc sys tmp
cat <<'_EOF_'>etc/vividcortex/global.conf
{
    "log-max-backups": "1",
    "log-max-size": "5",
    "override-os-certs": "true",
    "proxy-uri": "auto"
}
_EOF_
cat <<'_EOF_'>etc/vividcortex/vc-agent-007.conf
{
    "discover-containers": "false",
    "host-discovery-limit": "0",
    "forbid-restarts": "true",
    "foreground": "true"
}
_EOF_
wget -P usr/local/bin https://download.vividcortex.com/linux-static/x86_64/current/vc-agent-007
tar --create --xz --mode=777 --owner=root --group=root --file ../vividcortex.tar.xz *
cd ..
rm -rf vcimage.tmptmptmp
