//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Sum of n numbers
var sum = 0

for i in 0...10 {
    sum += i
}
sum

//:  Fibonacci Series
var fibonacci = 0
var temp1 = 1
var temp2 = 0

print(fibonacci)

for j in 0...10 {
    temp2 = fibonacci
    fibonacci += temp1
    temp1 = temp2
    print(fibonacci)
}