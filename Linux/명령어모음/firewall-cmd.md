# 1. 방화벽 실행 여부 확인
`firewall-cmd --state` or `systemctl status firewalld`

# 2. 방화벽 다시 로드
`firewall-cmd --reload`

# 3. 존(Zone) 출력하기
`firewall-cmd --get-zones`

# 4. 디폴트 존 출력하기
`firewall-cmd --get-default-zone`

# 5. 활성화된 존 출력하기
`firewall-cmd --get-active-zones`

# 6. 사용 가능한 서비스/포트 출력하기
`firewall-cmd --list-all`

# 7. public 존에 속한 사용 가능한 모든 서비스/포트 목록 출력하기
`firewall-cmd --zone=public --list-all`

# 8. ftp 서비스 추가하기
`firewall-cmd --add-service=ftp`

# 9. ftp 서비스 제거하기
`firewall-cmd --remove-service=ftp`

# 10. 21 tcp 포트 추가하기
`firewall-cmd --add-port=21/tcp`

# 11. 21 tcp 포트 제거하기
`firewall-cmd --remove-port=21/tcp`

---

<br/>

* zone 옵션이 없으면 기본 존(default zone)에 추가 또는 삭제를 한다. 다른 존에 작업하고 싶으면 zone 옵션을 추가해야함
ex) `firewall-cmd --zone=trusted --add-service=ftp`

* --permanent : 시스템 재부팅 또는 방화벽 재시작 후에도 적용되도록 하려면 사용하기
ex) `firewall-cmd --permanent --add-service=ftp`
