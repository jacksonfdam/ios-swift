//: Playground - noun: a place where people can play

import UIKit

//
// MARK: Controle de fluxo
//

// Array
var shoppingList = ["catfish", "water", "lemons"]
shoppingList[1] = "bottle of water"

// laço for (array)
let myArray = [1, 1, 2, 3, 5]
for value in myArray {
    if value == 1 {
        print("One!")
    } else {
        print("Not one!")
    }
}

// laço for (dicionário)
var dict = ["one": 1, "two": 2]
for (key, value) in dict {
    print("\(key): \(value)")
}

// laço for (alcance)
for i in -1...shoppingList.count {
    print(i)
}
shoppingList[1...2] = ["steak", "peacons"]
// use ..< para excluir o último número

// laço while (enquanto)
var i = 1
while i < 1000 {
    i *= 2
}

// laço do-while
repeat {
    print("hello")
} while 1 == 2

// Switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default: // required (in order to cover all possible input)
    let vegetableComment = "Everything tastes good in soup."
}
