//: Playground - noun: a place where people can play

import UIKit

//
// MARK: Estruturas
//

// Estruturas e classes tem funcionalidades muito similares
struct NamesTable {
    let names: [String]
    
    // Custom subscript
    subscript(index: Int) -> String {
        return names[index]
    }
}

// Estruturas possuem um inicializador auto-gerado automático (implícito)
let namesTable = NamesTable(names: ["Me", "Them"])
//let name = namesTable[2]
//print("Name is \(name)") // Name is Them

//
// MARK: Classes
//

// Classes, Estruturas e seus membros possuem três níveis de modificadores de acesso
// Eles são: internal (default), public, private

public class Shape {
    public func getArea() -> Int {
        return 0;
    }
}

// Todos os métodos e propriedades de uma classe são públicos.
// Se você só precisa armazenar dados em um objeto estruturado, use `struct`

internal class Rect: Shape {
    var sideLength: Int = 1
    
    // Getter e setter personalizado
    private var perimeter: Int {
        get {
            return 4 * sideLength
        }
        set {
            // `newValue` é uma variável implicita disponível para os setters
            sideLength = newValue / 4
        }
    }
    
    // Carregue uma propriedade sob demanda (lazy)
    // subShape permanece nil (não inicializado) até seu getter ser chamado
    lazy var subShape = Rect(sideLength: 4)
    
    // Se você não precisa de um getter e setter personalizado,
    // mas ainda quer roda código antes e depois de configurar
    // uma propriedade, você  pode usar `willSet` e `didSet`
    var identifier: String = "defaultID" {
        // o argumento `willSet` será o nome da variável para o novo valor
        willSet(someIdentifier) {
            print(someIdentifier)
        }
    }
    
    init(sideLength: Int) {
        self.sideLength = sideLength
        // sempre chame super.init por último quand inicializar propriedades personalizadas (custom)
        super.init()
    }
    
    func shrink() {
        if sideLength > 0 {
            sideLength -= 1
        }
    }
    
    override func getArea() -> Int {
        return sideLength * sideLength
    }
}

// Uma classe básica `Square` que estende `Rect`
class Square: Rect {
    convenience init() {
        self.init(sideLength: 5)
    }
}

var mySquare = Square()
print(mySquare.getArea()) // 25
mySquare.shrink()
print(mySquare.sideLength) // 4

// Compara instâncias, não é o mesmo que == o qual compara objetos
if mySquare === mySquare {
    print("Yep, it's mySquare")
}


//
// MARK: Enums
//

// Enums podem opcionalmente ser de um tipo específico ou não.
// Podem conter métodos do mesmo jeito que classes.

enum Suit {
    case spades, hearts, diamonds, clubs
    func getIcon() -> String {
        switch self {
        case .spades: return "♤"
        case .hearts: return "♡"
        case .diamonds: return "♢"
        case .clubs: return "♧"
        }
    }
}

print(Suit.clubs.getIcon())









