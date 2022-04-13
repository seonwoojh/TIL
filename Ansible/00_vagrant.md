# Vagrant

## Vagrantfile 생성
```
vagrant init <IMAGE>
```

## VM 생성 및 부팅
```
vagrant up [VM_NAME]
```

## VM 재부팅
```
vagrant reload [VM_NAME]
```

## VM 종료
```
vagrant halt [VM_NAME]
```

## VM 삭제
```
vagrant destroy [VM_NAME]
```

## VM SSH 접속
```
vagrant ssh [VM_NAME]
```

## Vagrantfile 예제
```ruby
Vagrant.configure("2") do |config|
	# Define VM
	config.vm.define "myvm1" do |centos|
		centos.vm.box = "centos/7"
		centos.vm.hostname = "myvm1"
		centos.vm.network "private_network", ip: "192.168.56.11"
		centos.vm.provider "virtualbox" do |vb|
			vb.name = "myvm1"
			vb.cpus = 2
			vb.memory = 2048
		end
		config.vm.provision "shell", inline: <<-SHELL
			#!/bin/bash
			echo "hello world" > /tmp/hello.txt
		SHELL
	end
	# Define VM
	config.vm.define "myvm2" do |centos|
		centos.vm.box = "centos/7"
		centos.vm.hostname = "myvm2"
		centos.vm.network "private_network", ip: "192.168.56.12"
		centos.vm.provider "virtualbox" do |vb|
			vb.name = "myvm2"
			vb.cpus = 2
			vb.memory = 2048
		end
		config.vm.provision "shell", inline: <<-SHELL
			#!/bin/bash
			echo "hello world" > /tmp/hello.txt
		SHELL
	end
end
```

## Ansible 환경 설정

`~/vagrant/ansible/Vagrantfile`
```ruby
Vagrant.configure("2") do |config|
	# Define VM
	config.vm.define "controller" do |centos|
		centos.vm.box = "centos/7"
		centos.vm.hostname = "controller"
		centos.vm.network "private_network", ip: "192.168.100.10"
		centos.vm.provider "virtualbox" do |vb|
			vb.name = "controller"
			vb.cpus = 2
			vb.memory = 2048
		end
	end
	# Define VM
	config.vm.define "node1" do |centos|
		centos.vm.box = "centos/7"
		centos.vm.hostname = "node1"
		centos.vm.network "private_network", ip: "192.168.100.11"
		centos.vm.provider "virtualbox" do |vb|
			vb.name = "node1"
			vb.cpus = 2
			vb.memory = 2048
		end
	end
	# Define VM
	config.vm.define "node2" do |centos|
		centos.vm.box = "centos/7"
		centos.vm.hostname = "node2"
		centos.vm.network "private_network", ip: "192.168.100.12"
		centos.vm.provider "virtualbox" do |vb|
			vb.name = "node2"
			vb.cpus = 2
			vb.memory = 2048
		end
	end
end
```

파일의 인코딩
- UTF-8
- UTF-16

라인의 끝
- CRLF: Windows
- LF: Unix-like

```
vagrant up
```

### node1 패스워드 인증 활성화
```
vagrant ssh node1
```

```
sudo vi /etc/ssh/sshd_config
```
```
PasswordAuthentication yes
```

```
sudo systemctl restart httpd
```

### node2 패스워드 인증 활성화
```
vagrant ssh node2
```

```
sudo vi /etc/ssh/sshd_config
```
```
PasswordAuthentication yes
```

```
sudo systemctl restart httpd
```

### contoller
```
vagrant ssh controller
```

```
ssh-keygen
```

```
ssh-copy-id vagrant@192.168.100.11
ssh-copy-id vagrant@192.168.100.12
```
