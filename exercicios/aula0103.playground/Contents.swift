//: Playground - noun: a place where people can play

import UIKit

//
// MARK: Closures
//
var numbers = [1, 2, 6]

// Funções são casos especiais de closures ({})

// Exemplo de closure.
// `->` separa argumentos e tipo de retorno
// `in` separa o cabeçalho do closure do seu corpo
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// Quando o tipo é conhecido, como abaixo, nós podemos fazer o seguinte
numbers = numbers.map({ number in 3 * number })
// Ou até mesmo isso
//numbers = numbers.map({ $0 * 3 })

print(numbers) // [3, 6, 18]

// Closure restante
numbers = numbers.sorted { $0 > $1 }

print(numbers) // [18, 6, 3]
