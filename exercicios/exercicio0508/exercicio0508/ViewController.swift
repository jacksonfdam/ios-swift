//
//  ViewController.swift
//  exercicio0508
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var str = "Hello, World"
        print("Original string: \"\(str)\"")
        
        if let base64Str = str.base64Encoded() {
            print("Base64 encoded string: \"\(base64Str)\"")
            if let trs = base64Str.base64Decoded() {
                print("Base64 decoded string: \"\(trs)\"")
                print("Check if base64 decoded string equals the original string: \(str == trs)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

