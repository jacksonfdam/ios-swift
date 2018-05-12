//: Playground - noun: a place where people can play

import Foundation

import UIKit

//
// MARK: Noções básicas
//

// Xcode supporta anotações para seu código e lista elas na barra de atalhos
// MARK: Marca uma sessão
// TODO: Faça algo logo
// FIXME: Conserte esse código

print("Hello, world")

// Valores em variáveis (var) podem ter seu valor alterado depois de declarados.
// Valores em constantes (let) NÃO podem ser alterados depois de declarados.

var myVariable = 42
let øπΩ = "value" // nomes de variáveis em unicode
let π = 3.1415926
let convenience = "keyword" // nome de variável contextual
let weak = "keyword"; let override = "another keyword" // comandos podem ser separados por uma ponto e vírgula
let `class` = "keyword" // Crases permitem que palavras-chave seja usadas como nome de variáveis
let explicitDouble: Double = 70
let intValue = 0007 // 7
let largeIntValue = 77_0008 // 77000
let label = "some text " + String(myVariable) // Coerção
let piText = "Pi = \(π), Pi 2 = \(π * 2)" // Interpolação de strings

// Constrói valores específicos
// Utiliza configuração de build -D
#if false
print("Not printed")
let buildValue = 3
#else
let buildValue = 7
#endif
print("Build value: \(buildValue)") // Build value: 7


/*
 Optionals fazem parte da linguagem e permitem que você armazene um
 valor `Some` (algo) ou `None` (nada).
 
 Como Swift requer que todas as propriedades tenham valores, até mesmo nil deve
 ser explicitamente armazenado como um valor Optional.
 
 Optional<T> é uma enum.
 */
var someOptionalString: String? = "optional" // Pode ser nil
// o mesmo acima, mas ? é um operador pós-fixado (açúcar sintático)
var someOptionalString2: Optional<String> = "optional"

if someOptionalString != nil {
    // Eu não sou nil
    if someOptionalString!.hasPrefix("opt") {
        print("has the prefix")
    }
    
    let empty = someOptionalString?.isEmpty
}
someOptionalString = nil

// Optional implicitamente desempacotado (unwrapped)
var unwrappedString: String! = "Valor é esperado."
// o mesmo acima, mas ? é um operador pósfixado (açúcar sintático)
var unwrappedString2: ImplicitlyUnwrappedOptional<String> = "Valor é esperado."

if let someOptionalStringConstant = someOptionalString {
    // Tem `Some` (algum) valor, não nil
    if !someOptionalStringConstant.hasPrefix("ok") {
        // não possui o prefixo
    }
}


// Swift tem suporte para armazenar um valor de qualquer tipo.
// AnyObject == id
// Ao contrário de Objective-C `id`, AnyObject funciona com qualquer valor (Class, Int, struct, etc)
var anyObjectVar: AnyObject = 7 as AnyObject
anyObjectVar = "Mudou o valor para string, não é uma boa prática, mas é possível." as AnyObject

/*
 Comentário aqui
 /*
 Comentários aninhados também são suportados
 */
 */


//
// MARK: Coleções
//

/*
 Tipos Array e Dicionário são structs. Portanto `let` e `var`
 também indicam se são mutáveis (var) ou imutáveis (let) quando declarados
 com esses tipos.
 */

// Array
var shoppingList = ["catfish", "water", "lemons"]
shoppingList[1] = "bottle of water"
let emptyArray = [String]() // imutável
var emptyMutableArray = [String]() // mutável


// Dicionário
var occupations = [
    "Malcolm": "Captain",
    "kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"
let emptyDictionary = [String: Float]() // imutável
var emptyMutableDictionary = [String: Float]() // mutável
occupations