# Playbook

- playbook: YAML 파일
	- `.yaml`, `.yml`
- play
- task

`test.yaml`
```yaml
# Play
- hosts: host1
  tasks:
    # Task
    - yum:
        name: httpd
        state: installed
    # Task
    - service
        name: httpd
        state: started
        enabled: yes

```

> 참고
> `ansible host1 -m yum -a 'name=httpd state=installed'`
> `ansible host1 -m service -a 'name=httpd state=started enabled=yes'

```
ansible-playbook test.yaml
```

---

## vim
```
yum -y install vim-enhanced
```

`~/.vimrc`
```
syntax on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et ai
set cursorline
```

```
vim test.yaml
```

---

## 플레이북 실행

```
ansible-playbook <PLAYBOOK>.yaml
```

YAML 문법 확인
```
ansible-playbook wordpress.yaml --syntax-check
```

플레이북 시뮬레이션
```
ansible-playbook wordpress.yaml --check
```

텍스트의 변경 사항 확인
```
ansible-playbook wordpress.yaml --diff
```
> --check 옵션과 함께 사용하는 경우가 많다.

실행할 시스템 제한
```
ansible-playbook wordpress.yaml --limit 192.168.100.12
```

적용될 호스트 목록
```
ansible-playbook wordpress.yaml --list-hosts
```

플레이북의 작업 목록
```
ansible-playbook wordpress.yaml --list-tasks
```

플레이북의 태그 목록
```
ansible-playbook wordpress.yaml --list-tags
```
