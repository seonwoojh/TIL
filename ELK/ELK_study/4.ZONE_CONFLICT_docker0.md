## ZONE_CONFLICT:'docker0' already bound to a zone 오류 해결법

1. Check if docker zone exists in firewall-cmd


    `$ firewall-cmd --get-active-zones`
2. If "docker" zone is available, change interface to docker0 (not persisted)


    `$ sudo firewall-cmd --zone=docker --change-interface=docker0`
    
3. If "docker" zone is available, change interface to docker0


    `$ sudo firewall-cmd --permanent --zone=docker --change-interface=docker0`
    
    `$ sudo systemctl restart firewalld`
