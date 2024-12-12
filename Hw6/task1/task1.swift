//
//  task1.swift
//  Hw6
//
//  Created by david david on 11.12.2024.
//
// https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
// https://www.tutorialspoint.com/swift-program-to-find-the-prime-numbers-from-the-array
// https://stackoverflow.com/questions/24130026/how-to-sort-an-array-of-custom-objects-by-property-value
import Foundation
class FirstTask {
    
    func checkPrime(_ num: Int) -> Bool {
       if num <= 1 {
           return false
       }
       for element in 2..<num where num % element == 0 {
             return false
       }
       return true
    }
    
    func executeArray (array: [Int]) {
        
        let dividedArray = array.chunked(into: 4)
        var currentIndex = 0
        var dividedArrayIndexed: [[(Int, Int)]] = []
        
        for element in dividedArray {
            var indexedElement: [(Int, Int)] = []
            for num in element {
                indexedElement.append((currentIndex, num))
                currentIndex += 1
            }
            dividedArrayIndexed.append(indexedElement)
        }
        
        var primes: [(Int, Int)] = []
        var finalArray: [Int] = []
        let dispGroup = DispatchGroup()
        for div in dividedArrayIndexed {
            dispGroup.enter()
            DispatchQueue.global().async {
                for divEl in div where self.checkPrime(divEl.1) {
                    // as tests shown it works fine with and without  dispQueue.sync {
                    // }
                        primes.append(divEl)
                    
                }
                dispGroup.leave()
            }
            
        }
        dispGroup.notify(queue: .main) {
            print("Completed:")
            primes.sort { $0.0 < $1.0}
            for finalArrayElement in primes {
                finalArray.append(finalArrayElement.1)
            }
            print(finalArray)
        }
        
    }
}
// this extension is referenced above
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
