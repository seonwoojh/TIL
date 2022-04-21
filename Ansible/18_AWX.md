# AWX
Ansible 위에 구축된 웹 기반의 인터페이스
목적: 실행 / 모니터링

AWX: RedHat Ansible Tower 제품의 Upstream

> CentOS --up--> RHEL --up--> Fedora
RHEL --> CentOS Stream --> Fedora
Ansible Tower --> AWX
Ubuntu --> Debian

AnsibleWorks -> AWX

## AWX 설치
### Docker 설치

> https://docs.docker.com/engine/install/centos/

```
sudo yum install -y yum-utils
```

```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

```
sudo yum install -y docker-ce docker-ce-cli containerd.io
```

```
sudo systemctl enable --now docker
```

```
docker --version
```

### Docker-Compose 설치

```
sudo yum install -y python3 python3-pip
```

```
sudo pip3 install -U -I pip wheel setuptools
sudo pip3 install docker-compose
```

```
docker-compose --version
```

### AWX 설치

```
sudo yum -y install git
```

```
cd ~
git clone --branch 17.1.0 --single-branch https://github.com/ansible/awx.git
```

```
cd ~/awx/installer
```

`~/awx/installer/inventory`
```ini
108 admin_password=password
141 project_data_dir=/var/lib/awx/projects
```

```
sudo yum -y install libselinux-python3
```

```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

```
ansible-playbook -i inventory install.yml -b
```

```
sudo docker ps
```
```
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                                   NAMES
1ea4d852e694   ansible/awx:17.1.0   "/usr/bin/tini -- /u…"   11 minutes ago   Up 11 minutes   8052/tcp                                awx_task
9c527c75a323   ansible/awx:17.1.0   "/usr/bin/tini -- /b…"   20 minutes ago   Up 11 minutes   0.0.0.0:80->8052/tcp, :::80->8052/tcp   awx_web
f6775cad37ab   redis                "docker-entrypoint.s…"   20 minutes ago   Up 11 minutes   6379/tcp                                awx_redis
16d33e864106   postgres:12          "docker-entrypoint.s…"   20 minutes ago   Up 11 minutes   5432/tcp                                awx_postgres
```

`Create Preload data` 작업에서 오류 발생시 확인
```
sudo docker exec awx_task bash -c "/usr/bin/awx-manage create_preload_data"
```
```
An organization is already in the system, exiting.
(changed: False)
```

웹브라우저
```
http://192.168.100.10
```


## AWX 리소스 생성

- Projects: 플레이북을 가지는 리소스
	- /var/lib/awx/projects
- Inventories: 관리 노드/인벤토리 그룹을 가지는 리소스
- Credentials: SSH, Sudo, Vault 등 자격증명 정보를 가지는 리소스
- Templates: 프로젝트, 인벤토리, 자격증명을 가지는 리소스

### 플레이북 준비
```
sudo mkdir /var/lib/awx/projects/test-awx
sudo vi /var/lib/awx/projects/test-awx/debug.yaml
```
```yaml
- hosts: all
  tasks:
    - debug:
        msg: Hello AWX World
```

```
[test-awx-group]
192.168.100.11
```

### 프로젝트 생성
Resouces -> Projects -> Add
- Name: test-awx-project
- Source Control Credentials Type: manual
- Playbook Directory: test-awx
- `Save`

### 인벤토리 생성
Resources -> Inventories -> Add -> Add Inventory

- Create new inventory
	- Name: test-awx-inventory
	- `Save`

- Details -> Groups 탭 -> Add
	- Name: test-awx-group
	- 'Save'

- Group details -> Hosts 탭 -> Add -> Add new host
	- Name: 192.168.100.11
	- `Save`

### 자격증명 생성
Resources -> Credentials -> Add
- Name: test-awx-credentials
- Credential Type: Machine
- Username: vagrant
- SSH Private Key
	- controller 시스템의 vagrant 사용자의 홈디렉토리에서 ~/.ssh/id_rsa 파일 내용 복사
- Privilege Escalation Method: sudo
- Privilege Escalation Username: root
- `Save`

### 템플릿 생성
Resources -> Templates -> Add -> Add job template
- Name: test-awx-template
- Inventory: test-awx-inventory
- Project: test-awx-project
- Playbook: debug.yaml
- Credentials: test-awx-credentials
- `Save`

### 작업 실행
Resources -> Templates -> test-awx-template -> 로켓 버튼
