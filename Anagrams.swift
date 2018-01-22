/*
Given an array of strings, return all groups of strings that are anagrams. Represent a group by a list of integers representing the index in the original list. Look at the sample case for clarification.

 Anagram : a word, phrase, or name formed by rearranging the letters of another, such as 'spar', formed from 'rasp' 
 Note: All inputs will be in lower-case. 
Example :

Input : cat dog god tca
Output : [[1, 4], [2, 3]]
cat and tca are anagrams which correspond to index 1 and 4. 
dog and god are another set of anagrams which correspond to index 2 and 3.
The indices are 1 based ( the first element has index 1 instead of index 0).

 Ordering of the result : You should not change the relative ordering of the words / phrases
*/

import Foundation

class Solution {
	func anagrams(_ A: [String]) -> [[Int]] {
        var result = [[Int]]()
        var anagramDict = [String:[Int]]()
        var existArr = [Int]()
    
        for i in 0..<A.count {
            var sortedName = sortedString(A[i])
            let keyExists = anagramDict[sortedName] != nil
        
            if keyExists {
                if(anagramDict[sortedName]!.count > 0) {
                    existArr = anagramDict[sortedName]!
                    existArr.append(i+1)
                    anagramDict[sortedName] = existArr
                }
            }
            else {
                var arr = [Int]()
                arr.append(i+1)
                anagramDict[sortedName] = arr
            }
            
        }
        
        for key in anagramDict.keys {
            result.append(anagramDict[key]!)
        }
        
        return result
	}
}

func sortedString(_ inpSt: String) -> String {
    let inpStArray = Array(inpSt.characters)
    return String(inpStArray.sorted())
}
