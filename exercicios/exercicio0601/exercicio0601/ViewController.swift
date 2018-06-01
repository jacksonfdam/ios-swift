//
//  ViewController.swift
//  exercicio0601
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://randomuser.me/api") {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
            }catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }
        } else {
            print("Ooops! BAD URL")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

