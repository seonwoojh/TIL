[ Multi node 엘라스틱 ]
3개의 노드를 가진 엘라스틱 클러스터를 도커 위에 띄우고, 실행시키기 위해 docker compose 파일 생성

 

Docker Compose 용어 정리
1. version

- 파일 규격 버전

- 규격에 따라 지원 내용이 다르기 때문에 자세한 내용은 아래 링크 참고

- docs.docker.com/compose/compose-file/compose-versioning/

 
2. services

- 컨테이너 정의 (=container)

 

3. image

- 베이스로 사용할 도커 이미지

 

4. environment

-e 옵션에 해당하는 내용으로 엘라스틱 환경 설정

> node.name : 노드 이름

> cluster.name : 클러스터명 (클러스터명을 기준으로 노드가 join 한다)

> discovery.seed_hosts: 디스커버리 설정, 클러스터를 구성할 노드에 대한 정의

> cluster.initial_master_node : 마스터로 선출될 후보 노드 초기 세팅 (node.name 참조)

> bootstrap.memory_lock : 엘라스틱이 사용할 메모리 Lock

> ES_JAVA_OPTS : jvm이 사용 가능한 힙 사이즈 결정

 

5. ulimits 

- 프로세스 자원 한도 설정

> memlock : 메모리 내 주소 공간의 최대 크기 (soft: 기본 적용 값, hard: soft에서 최대로 늘릴 한도)

 

6. volumes

- 공유 볼륨 설정

 

7. port 

-  공유할 포트 설정 (로컬 포트:컨테이너 포트)

 

8. networks

하나의 네트워크로 통신하기 위해 현재 elastic으로 모두 지정

> driver : bridge, host, container, none 이렇게 4개가 존재함 (default는 bridge)
