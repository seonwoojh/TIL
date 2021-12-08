# 코로나 대시보드를 위한 데이터 수집 파이썬 스크립트

import csv, requests
import pandas as pd

CSV_URL = "https://raw.githubusercontent.com/jooeungen/coronaboard_kr/master/kr_regional_daily.csv"

# 확진, 사망, 격리해제

yesterday_data = {}
yesterday_data['서울'] = [0, 0, 0]
yesterday_data['부산'] = [0, 0, 0]
yesterday_data['대구'] = [0, 0, 0]
yesterday_data['인천'] = [0, 0, 0]
yesterday_data['광주'] = [0, 0, 0]
yesterday_data['대전'] = [0, 0, 0]
yesterday_data['울산'] = [0, 0, 0]
yesterday_data['세종'] = [0, 0, 0]
yesterday_data['경기'] = [0, 0, 0]
yesterday_data['강원'] = [0, 0, 0]
yesterday_data['충북'] = [0, 0, 0]
yesterday_data['충남'] = [0, 0, 0]
yesterday_data['전북'] = [0, 0, 0]
yesterday_data['전남'] = [0, 0, 0]
yesterday_data['경북'] = [0, 0, 0]
yesterday_data['경남'] = [0, 0, 0]
yesterday_data['제주'] = [0, 0, 0]
yesterday_data['검역'] = [0, 0, 0]

flag = False
csv_data = []

with requests.Session() as s:
    download = s.get(CSV_URL)
    decoded_content = download.content.decode('utf-8')
    cr = csv.reader(decoded_content.splitlines(), delimiter = ',')
    my_list = list(cr)
    for row in my_list:
        if row[0] == 'date':
            continue

        # 다음부터 과거 데이터의 차이만 다시 저장됨.
        row[2] = int(row[2]) - int(yesterday_data[row[1]][0])
        row[3] = int(row[3]) - int(yesterday_data[row[1]][1])
        row[4] = int(row[4]) - int(yesterday_data[row[1]][2])

        # 누적 데이터 저장
        yesterday_data[row[1]][0] += row[2]
        yesterday_data[row[1]][1] += row[3]
        yesterday_data[row[1]][2] += row[4]

        csv_data.append(row)

df = pd.DataFrame(csv_data)
df.to_csv('covid19_korea.csv', index = False,
          header = False, encoding='utf8')
