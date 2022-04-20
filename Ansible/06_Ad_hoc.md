# ad_hoc 명령

```
ansible <HOST_PATTERN> -m <MODULE> -a <PARAMETER>
```

> https://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html

## Wordpress 구성에 필요한 작업
패키지 설치: yum
서비스 제어: service
텍스트 수정: lineinfile, blockinfile, replace
압축: archive, unarchive
방화벽: firewalld, ufw, iptables
파일 복사: copy, fetch
파일 다운로드: get_url
데이터베이스 관리: mysql_db, mysql_user
파일 관리: file

---

## Ansible Jump Host with Bastion Host
> https://www.jeffgeerling.com/blog/2022/using-ansible-playbook-ssh-bastion-jump-host

`aws-ec2.ini`
```ini
[ec2]
ip-172-31-69-42.ap-northeast-2.compute.internal

[ec2:vars]
ansible_user=ec2-user
ansible_ssh_common_args='-o ProxyCommand="ssh -p 22 -W %h:%p -q ec2-user@3.36.67.173"'
```

```
ansible ec2 -i aws-ec2.ini -m command -a hostname
```

---

## Ad-hoc 명령으로 Wordpress 구성

```
ansible wp -m yum -a "name=https://rpms.remirepo.net/enterprise/remi-release-7.rpm state=present validate_certs=no" -b
```

```
ansible wp -m yum_repository -a 'name=remi-safe file=remi-safe mirrorlist=http://cdn.remirepo.net/enterprise/7/safe/mirror description=remi-safe enabled=no' -b
```

```
ansible wp -m yum_repository -a 'name=remi-php74 file=remi-php74 mirrorlist=http://cdn.remirepo.net/enterprise/7/php74/mirror description=remi-php74 enabled=yes' -b
```

```
ansible wp -m yum -a 'name=httpd,php,php-mysql,mariadb,mariadb-server,python2-PyMySQL state=installed' -b
```

```
ansible wp -m service -a 'name=httpd state=started enabled=yes' -b
```

```
ansible wp -m service -a 'name=mariadb state=started enabled=yes' -b
```

```
ansible wp -m get_url -a 'url=https://wordpress.org/wordpress-5.9.3.tar.gz dest=/home/vagrant'
```

```
ansible wp -m unarchive -a 'src=/home/vagrant/wordpress-5.9.3.tar.gz remote_src=yes dest=/var/www/html owner=apache group=apache' -b
```

```
ansible wp -m mysql_db -a 'name=wordpress state=present login_user=root'
```

```
ansible wp -m mysql_user -a 'name=wpadm password=P@ssw0rd state=present login_user=root priv="wordpress.*:ALL"'
```

```
ansible wp -m copy -a 'src=/var/www/html/wordpress/wp-config-sample.php remote_src=yes dest=/var/www/html/wordpress/wp-config.php owner=apache group=apache' -b
```

```
ansible wp -m replace -a 'path=/var/www/html/wordpress/wp-config.php regexp=database_name_here replace=wordpress' -b
```

```
ansible wp -m replace -a 'path=/var/www/html/wordpress/wp-config.php regexp=username_here replace=wpadm' -b
```

```
ansible wp -m replace -a 'path=/var/www/html/wordpress/wp-config.php regexp=password_here replace=P@ssw0rd' -b
```

---

```
ansible wp -m service -a 'name=httpd state=stopped' -b
ansible wp -m service -a 'name=mariadb state=stopped' -b
ansible wp -m file -a 'path=/var/www/html/wordpress state=absent' -b
ansible wp -m file -a 'path=/home/vagrant/wordpress-5.9.3.tar.gz state=absent' -b
ansible wp -m yum -a 'name=httpd,php,php-mysql,mariadb,mariadb-server,python2-PyMySQL autoremove=yes state=absent' -b
ansible wp -m file -a 'name=/var/lib/mysql state=absent' -b
ansible wp -m yum -a 'name=remi-release autoremove=yes state=absent' -b
```
