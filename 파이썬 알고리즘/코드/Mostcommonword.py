# 금지된 단어를 제외한 가장 흔하게 등장하는 단어를 출력하기. 대소문자 구분 x 구두점(마침표, 쉼표 등) 제거.

import re
from typing import List
import collections
paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
banned = ["hit"]

class Solution:
    def Mostcommonword(self, paragraph: str, banned: List[str]) -> str:
        words = [word for word in re.sub(r'[^\w]', " ", paragraph).lower().split()
                 if word not in banned] # \w는 단어문자를 의미, ^ = not을 의미

        counts = collections.Counter(words)
        # 가장 흔하게 등장하는 단어의 첫 번째 인덱스 리턴
        return counts.most_common(1)[0][0]

# 결과 확인
a = Solution()
print(a.Mostcommonword(paragraph, banned))