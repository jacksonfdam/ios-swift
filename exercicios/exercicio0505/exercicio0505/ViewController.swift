//
//  ViewController.swift
//  exercicio0505
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let quantidade_minima:Int = 10
    let quantidade_maxima:Int = 100

    // Declarar o tipo do Erro
    enum MeuErro: Error {
        case Quantidadeinferior
        case QuantidadeSuperior
    }
    
    enum NumeroInvalido : Error{
        case par
        case muitogrande
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // String literal
        var a = "Hello "

        // Append something
        a += "World!"
        print(a)


        // String literal
        let s = "hello horld"

        // Replace "World" with "Guys"

        let b = s.capitalized
        print(b)

        // Create the Unique Identifier

        let uuid = NSUUID().uuidString
        print("uuid: \(uuid)")


        // Get the length of the string
        print("uuid size: \(uuid.characters.count)")

        let c = s.replacingOccurrences(of: "World", with:"Guys")
        print(b)

        let reversed = String(s.reversed())
        print(reversed)

        let rand = Int(arc4random_uniform(10))

        print(rand)

        do {
            let contents = try NSString(contentsOfFile: "arquivoquenaoexiste.txt", encoding: String.Encoding.utf8.rawValue)
            print(contents)
        }
        catch let error as NSError {
            print("Ooops! Aconteceu um erro: \(error)")
        }
        
        do{
            try printSmallNumber(x: 67)
        }catch NumeroInvalido.par{
            print("O numero é par")
        }catch NumeroInvalido.muitogrande{
            print("O numero é maior que 100")
        }catch{
            print("Qualquer erro!")
        }
        

        do {
            try testaEstoque(quantidade:5)
        } catch MeuErro.Quantidadeinferior {
            print("Ooops! Você não pode pedir menos que \(quantidade_minima)")
        } catch MeuErro.QuantidadeSuperior {
             print("Ooops! Você não pode pedir mais que \(quantidade_maxima)")
        }catch{
            print("Qualquer erro!")
        }
        

    }

    func testaEstoque(quantidade: Int) throws {
        if quantidade < quantidade_minima {
            throw MeuErro.Quantidadeinferior
        }
        else if quantidade > quantidade_maxima {
            throw MeuErro.QuantidadeSuperior
        }
        else {
            print("Ok! pediu : \(quantidade) ")
        }
    }
    
    func printSmallNumber(x :Int) throws{
        if x % 2 == 0 {
            throw NumeroInvalido.par
        }
        else if x > 100 {
            throw NumeroInvalido.muitogrande
        }
        print("Numero é \(x)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

