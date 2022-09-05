# URI 검색 - http 주소에 검색할 명령을 매개변수 형식으로 포함해서 호출하는 검색

## q(query) - 질의 명령을 입력하는 가장 기본적인 검색 매개변수
GET _search?q=title:time&pretty

## df(default field) - q 질의에 필드명을 넣는 대신 df 매개변수를 사용해 검색할 필드를 지정할 수 있다.
GET _search?q=time&df=title&pretty

## default_operator - 조건 명령어를 지정하지 않고 공백으로 질의어를 나누면 기본값인 OR로 인식한다.
GET _search?q=title:time%20machine&pretty


## explain - explain 매개변수를 추가하면 각 검색 처리에 대해 해당 검색 결과의 점수 계산에 사용된 상세 값이 출력됨.
GET /_search?q=title:time&explain

## _source - 매개변수의 값을 false로 설정하면 검색결과에서 도큐먼트 내용은 표시하지 않고 hit수와 점수(score) 등의 메타 정보만 출력함.

GET _search?q=title:time&_source=false&pretty

## sort - 검색결과의 출력 순서를 정할 수 있다. 기본적으로 검색결과는 _score 값을 기준으로 정렬된다.

GET books/_search?q=author:jules&sort=pages:desc

## timeout - 검색이 수행되는 동안 기다리는 제한시간을 지정할 수 있다.(밀리 초)

## from - 검색된 결과를 몇번째 값부터 출력할지 지정한다. default 0
GET books/_search?q=author:jules&from=1&pretty