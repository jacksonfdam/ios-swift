//
//  ViewController.swift
//  exercicio0502
//
//  Created by Jackson on 25/05/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scene1Label: UILabel!
    
    /*
    A terminologia oficial de storyboard para um ViewController é “scene”, mas você pode usar os termos de forma intercambiável.
    Uma cena representa um ViewController no storyboard.
    Aqui você vê um único ViewController contendo uma vista vazia.
    A seta apontando para o ViewController da esquerda indica que é o ViewController inicial a ser exibido para este storyboard.
    A criação de um layout no editor de storyboard é feita arrastando os controles da Biblioteca de objetos (veja o canto inferior direito) para o ViewController.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    /*
    Há uma versão em miniatura deste Document Outline acima da cena chamada Dock:
    O Dock mostra os objetos de nível superior na cena. Cada cena tem pelo menos um objeto View Controller, um objeto First Responder e um objeto Exit.
    Pode potencialmente ter outros objetos de nível superior também.
    O Dock é conveniente para fazer conexões a tomadas e ações.
    Se você precisar conectar algo à cena, basta arrastar para seu ícone no Dock.

    Nota: você provavelmente não usará muito o First Responder. Este é um objeto proxy que se refere a qualquer objeto que tenha o status de primeiro respondedor em um dado momento.
    Por exemplo, você pode conectar o evento Touch Up Inside de um botão ao seletor `recortar`do Primeiro Respondente.
    Se em algum momento um campo de texto tiver foco de entrada, você poderá pressionar esse botão para tornar o campo de texto, que agora é o primeiro respondedor, `recortar`seu texto na área de trabalho.
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destination as! Tela02ViewController
        destination.labelText = "Vindo da Scene 1"
    }
    
    @IBAction func returned(segue: UIStoryboardSegue) {
        scene1Label.text = "Returned from Scene 2"
    }


}

