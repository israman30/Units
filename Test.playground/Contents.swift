import UIKit

var greeting = "Hello, playground"
/*Write an extension to Array to add a function called "sum". The Function will return the sum of all Elements on the array. The extension will only work for Elements of a type that can be added together.*/

extension Array where Element: AdditiveArithmetic  {
    func sum() -> Element {
        return reduce(.zero, +) 
    }
}

var numbers = [1, 2, 3] // -> 6
//numbers.sum()

var a = 10
var b = 12

(a, b) = (b, a)
//print(a, b)

func swapNumbers(nums: [Int], a: Int, b: Int) -> [Int] {
    var nums = nums
    var holder = 0
    var b = b
    for _ in 0..<nums.count {
        holder = nums[a]
        nums[a] = nums[b]
        nums[b] = holder
    }
    return nums
}
//swapNumbers(nums: numbers, a: 1, b: 2)

var duplicates = [1, 2, 2, 3, 4, 4, 5]

func removeDuplicates(array: [Int]) -> [Int] {
    var arr = [Int]()
    for num in array where !arr.contains(num) {
        arr.append(num)
    }
    return arr
}

//removeDuplicates(array: duplicates)

extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var arr = [Element]()
        for num in self where !arr.contains(num) {
            arr.append(num)
        }
        return arr
    }
}
//duplicates.removeDuplicates()

var array = [1, 2, 3]
var array2 = ["a", "b", "c"]

func reverseArray<T>(arr: inout [T]) -> [T] {
    for i in 0..<arr.count / 2 {
        arr.swapAt(i, arr.count - 1 - i)
    }
    return arr
}
reverseArray(arr: &array)
reverseArray(arr: &array2)
