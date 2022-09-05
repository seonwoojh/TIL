# URI 검색 - http 주소에 검색할 명령을 매개변수 형식으로 포함해서 호출하는 검색

## q(query) - 질의 명령을 입력하는 가장 기본적인 검색 매개변수
GET _search?q=title:time&pretty

## df(default field) - q 질의에 필드명을 넣는 대신 df 매개변수를 사용해 검색할 필드를 지정할 수 있다.
GET _search?q=time&df=title&pretty

## default_operator - 조건 명령어를 지정하지 않고 공백으로 질의어를 나누면 기본값인 OR로 인식한다.
GET _search?q=title:time%20machine&pretty


## explain - explain 매개변수를 추가하면 각 검색 처리에 대해 해당 검색 결과의 점수 계산에 사용된 상세 값이 출력됨.
GET /_search?q=title:time&explain