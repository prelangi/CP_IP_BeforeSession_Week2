/*
For Given Number N find if its COLORFUL number or not

Return 0/1

COLORFUL number:

A number can be broken into different contiguous sub-subsequence parts. 
Suppose, a number 3245 can be broken into parts like 3 2 4 5 32 24 45 324 245. 
And this number is a COLORFUL number, since product of every digit of a contiguous subsequence is different
Example:

N = 23
2 3 23
2 -> 2
3 -> 3
23 -> 6
this number is a COLORFUL number since product of every digit of a sub-sequence are different. 

Output : 1
*/

import Foundation

class Solution {
	func colorful(_ A: inout Int) -> Int {
        var actualNumbers = [Double: Double]()
        let givenNum = A
        let cnt = String(givenNum).count
    
        var product = givenNum
        var a2 = Array(repeating:0,count:cnt)
        //print(a2)
    
        //Populate a2 array with numbers from the given Number
        for i in 0..<cnt {
            //print("i: \(i), product: \(product)")
            let result = product%10
            a2[i] = result
            product = product/10
        }
    
    var value = Double(1)
    var keyExists = false
    
    for i in 0..<cnt {
        value = 1
        for j in i..<cnt {
            value = value * Double(a2[j])
            keyExists = actualNumbers[value] != nil
            if(keyExists) {
                return 0
            }
            actualNumbers[value] = value
        }
        
    }
    
    return 1
	}
}
