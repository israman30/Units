//: [Previous](@previous)

import Foundation

var dict = [Int:Any]()

dict[1] = "a"

var numbers = [1, 2, 3, 1, 2, 2]

func mostCommon(arr: [Int]) -> Int {
    var dict = [Int:Int]()
    arr.forEach {
        if let count = dict[$0] {
            dict[$0] = count + 1
        } else {
            dict[$0] = 1
        }
    }
    print(dict)
    for (_ , value) in dict where value == dict.values.max() {
        return value
    }
    return 0
}
mostCommon(arr: numbers)
// Max value in an array
numbers.reduce(Int.min, { max($0, $1) })
