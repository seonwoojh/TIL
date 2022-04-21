# Vault

파일, 일부 텍스트를 암호화
- 파일 수준
	- 플레이북 전체
	- **변수 파일**
	- include/import 작업 파일
- 텍스트 수준
	- 변수 값

Vault Password: AES
- 단일 패스워드
	- --ask-vault-pass
	- --vault-password-file
- 멀티 패스워드
	- --vault-id

## ansible-vault 명령
```
ansible-vault <SUB-COMMAND> <FILE>
```

- create: 암호화될 빈 파일 생성
- decrypt: 암호화된 파일 복호화
- edit: 암호화된 파일 수정(vi)
- view: 암호화된 파일 확인
- encrypt: 평문 파일 암호화
- rekey: Vault 패스워드 변경
- encrypt_string: 텍스트 암호화
```
ansible-vault encrypt_string
```
```
hello world[ctrl-d][ctrl-d]
```
```
hello world[enter]
[ctrl-d]
```

### 명령의 옵션
`--ask-vault-password`: 기본 옵션(Vault 패스워드 물음)
`--vault-password-file`: Vault 패스워드 파일 지정

### 안전하고 편하게 vault 패스워드를 사용하는 방법
`.vaultpass`
```
P@ssw0rd
```

```
chmod 600 .vaultpass
```

`ansible.cfg`
```
[defaults]
vault_password_file = ./.vaultpass
```


## 암호화된 플레이북 실행
```
ansible-playbook <Playbook> --ask-vault-pass
```

```
ansible-playbook <Playbook> --vault-password-file <Vault_Password_File>
```

## 멀티 패스워드
--vault-id 옵션 사용
--vault-id ID@source

source
- prompt: 패스워드를 대화식의 프롬프트
	- --vault-id user1@prompt
- file: 파일에서 패스워드를 참조
	- --vault-id user2@.vaultpass
- script: 패스워드를 참조할 수 있는 스크립트
	- 예:  패스워드는 MySQL 저장, python 코드로 DB에서 패스워드를 가져올 수 있는
	- --vault-id user3@getpass.py

### prompt

`test.yaml`
```
- hosts: 192.168.100.11
  vars_files:
    - var1.yaml
    - var2.yaml
  tasks:
    - debug:
        msg: "{{ message1 }} {{ message2 }}"
```

```
echo "message1: hello" > var1.yaml
echo "message2: world" > var2.yaml
```

```
ansible-vault encrypt var1.yaml --vault-id user1@prompt
ansible-vault encrypt var2.yaml --vault-id user2@prompt
```

```
ansible-playbook test.yaml --vault-id user1@prompt --vault-id user2@prompt
```

### vault file
```
echo "message1: hello" > var1.yaml
echo "message2: world" > var2.yaml

echo "P@ssw0rd1" > user1pass
echo "P@ssw0rd2" > user2pass

chmod 600 user1pass 
chmod 600 user2pass 

ansible-vault encrypt var1.yaml --vault-id user1@user1pass
ansible-vault encrypt var2.yaml --vault-id user1@user2pass

ansible-playbook test.yaml --vault-id user1@user1pass --vault-id user1@user2pass
```

### 안전하고 편하게 vault 멀티 패스워드를 사용하는 방법
`ansible.cfg`
```
[defaults]
vault_identity_list = user1@user1pass, user2@user2pass
```

복호화
```
ansible-vault view var2.yaml
ansible-playbook test.yaml
```

암호화
```
ansible-vault create var3.yaml --encrypt-vault-id user1
absible-vault encrypt var3.yaml --encrypt-vault-id user1
```
