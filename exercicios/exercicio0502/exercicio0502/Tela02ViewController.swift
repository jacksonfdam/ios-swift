//
//  Tela02ViewController.swift
//  exercicio0502
//
//  Created by Jackson on 25/05/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class Tela02ViewController: UIViewController {

    @IBOutlet weak var scene2Label: UILabel!
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene2Label.text = labelText

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func voltar(_ sender: Any) {
        //presented modally
        let vc = Tela02ViewController()
        vc.dismiss(animated: true, completion: nil)
    }

    
}
