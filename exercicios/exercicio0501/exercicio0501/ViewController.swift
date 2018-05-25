//
//  ViewController.swift
//  exercicio0501
//
//  Created by Jackson on 25/05/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Hoisting
    let _debug: Bool = true
    let _logtag: String = "ViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self._debug { print("\(self._logtag) - viewDidLoad") }
        addBehaviors(behaviors: [HideNavigationBarBehavior()])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if self._debug { print("\(self._logtag) - didReceiveMemoryWarning") }
        // Dispose of any resources that can be recreated.
    }


}

