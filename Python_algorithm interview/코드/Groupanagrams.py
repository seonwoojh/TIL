# 문자열 배열을 받아 애너그램 단위로 그룹핑하기.

ss = ["eat", "tea", "tan", "ate", "nat", "bat"]
from typing import List
import collections

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagrams = collections.defaultdict(list)

        for word in strs:
            # 정렬하여 딕셔너리에 추가
            anagrams[''.join(sorted(word))].append(word)
        return anagrams.values()


a = Solution()
print(a.groupAnagrams(ss))