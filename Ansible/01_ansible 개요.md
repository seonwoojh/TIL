# Ansible 목차
- Ansible
	- Ansible 아키텍처
		- 설정
		- 모듈
		- 인벤토리
	- Ad-hoc
	- **Playbook**
		- YAML
		- 변수, 조건문, 반복문
		- 포함, 역할 ...
	- Vault: 암호화
	- AWX: 웹 인터페이스(모니터링)
	- Git, GitHub

# IaC?
Infrastructure as Code: 코드형 인프라

장점
- 비용 절감
- 빠른 속도
- 안정성
- 재사용성
- 버전 관리

## 구성 관리 / 배포
구성 관리: Configuration Management
	 패키지 설치, 설정 파일, 파일 복사 ...
배포: Provisioning
	리소스 새로 생성
	리소스 변경, 삭제, 관리

구성관리 도구: **Ansible**, Chef, Puppet, SaltStack ...
배포: **Terraform**, Vagrant, AWS CloudFormation

## 가변 인프라 / 불변 인프라
가변: Mutable
	Ansible
불변: Immutable
	Terraform

> 참고: 애완동물 vs 소때(가축)

## 절차적 / 선언적
절차적: 순서O
	Ansible
선언적: 순서X
	Terraform, Kubernetes

## 마스터 및 에이전트 유무
마스터, 에이전트: Chef, Puppet, SaltStack

# Ansible 맛보기

Ansible 설치
`controller`
```
sudo yum install centos-release-ansible-29 -y
sudo yum install ansible -y
```

설치 확인
```
ansible --version
```

인벤토리
```
vi inventory.ini
```
```ini
192.168.100.11
192.168.100.12
```

Ad-hoc 명령: 

yum 모듈로 httpd 패키지 설치
```
ansible 192.168.100.11 -i inventory.ini -m yum -a "name=httpd state=present" -b
```
- ansible: ad-hoc 명령
- 192.168.100.11: 관리 노드(인벤토리 파일 정의 되어 있어야 함)
- -i inventory.ini: 인벤토리 파일명
- -m yum: 모듈 이름
- -a: 모듈 파라미터
- -b: 관리자 권한 취득(become --> sudo)

> https://docs.ansible.com/ansible/2.9/modules/yum_module.html#yum-module

service 모듈로 httpd 서비스 시작
```
ansible 192.168.100.11 -i inventory.ini -m service -a "name=httpd state=started enabled=yes" -b
```

> https://docs.ansible.com/ansible/2.9/modules/service_module.html#service-module


Playbook:
`apache_install.yaml`
```yaml
- hosts: 192.168.100.11
  tasks:
  - yum:
      name: httpd
      state: present
  - service:
      name: httpd
      enabled: yes
      state: started
```

```
ansible-playbook -i inventory.ini apache_install.yaml -b
```


## Ansible?

IT 인프라 구성 관리 자동화 도구

Ansible: 
- YAML: 구성 쉽다
- OpenSSH: 표준 통신 방식

## 용어
### 제어 노드
Control Node, Controller, Ansible Engine
조건: Unix 계열, python

### 관리 노드
Managed Node, Target Node/Host ...

BM, VM, Instance, Network Device

조건: 
- SSH가 가능한 모든 시스템, Python 설치
- Windows: WinRM(Windows Remote Management)

### 인벤토리
- 정적 인벤토리: 관리 노드의 목록 파일
- 동적 인벤토리: 클라우드, CMDB에서 관리 노드 목록 가져옴

### 플러그인
Ansible 기능 확장

### 모듈
Ansible 작업 실행 할 수 있는 기본 단위
Python Code

### Ad-hoc
Ansible 임시 실행
하나의 모듈을 실행

### 테스크(Task)
하나의 모듈을 실행 --> 하나의 테스크(작업)

### 플레이
하나 이상의 테스크의 모음

### 플레이북
하나 이상의 플레이 모음


