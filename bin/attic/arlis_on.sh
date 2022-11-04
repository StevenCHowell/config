#!/bin/bash
sh -f -X receiver@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' citrix) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /usr/bin/firefox https://citrix.arlis.umd.edu/vpn/index.html > /dev/null 2>&1
