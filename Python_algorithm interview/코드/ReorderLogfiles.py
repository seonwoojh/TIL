# 로그 파일 재정렬
# 1. 로그의 가장 앞 부분은 식별자. 2. 문자로 구성된 로그가 숫자 로그보다 앞에옴. 3. 식별자는 순서에 영향을 끼치지 않지만. 문자가 동일할 경우
# 식별자 순으로 한다. 4. 숫자로그는 입력 순서대로 한다.
from typing import List
logs = ["dig1 8 1 5 1", "let1 art can", "dig2 3 6", "let2 own kit dig", "let3 art zero"]

class Solution:
    def reorderLogFiles(self, logs: List[str]) -> List[str]:
        letters, digits = [], []
        for log in logs:
            if log.split()[1].isdigit():
                digits.append(log)
            else:
                letters.append(log)

        # 2개의 키를 람다 표현식으로 정렬
        letters.sort(key = lambda x: (x.split()[1:], x.split()[0]))
        return letters + digits

# 결과 확인
a = Solution()
print(a.reorderLogFiles(logs))
