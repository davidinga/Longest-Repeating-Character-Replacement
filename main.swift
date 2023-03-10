/*
You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

 

Example 1:

Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.
Example 2:

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
*/

func characterReplacement(_ s: String, _ k: Int) -> Int {
    var s = s.map(Character.init)
    var maxLength = 0
    var maxCount = 0
    var counts: [Character: Int] = [:]
    var leftIdx = 0

    for rightIdx in s.indices {
        counts[s[rightIdx], default: 0] += 1
        maxCount = max(counts[s[rightIdx]]!, maxCount)

        while (rightIdx - leftIdx + 1) - maxCount > k {
            counts[s[leftIdx], default: 0] -= 1
            leftIdx += 1
        }

        maxLength = max((rightIdx - leftIdx + 1), maxLength)
    }

    return maxLength
}