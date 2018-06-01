//
//  ViewController.swift
//  exercicio0607
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let api_url = "https://randomuser.me/api/?results=10";

    var nameArray = [String]()

    func getJsonFromUrl(){
        let url = NSURL(string: api_url)

        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "results")!)

                if let results = jsonObj!.value(forKey: "results") as? NSArray {
                    for user in results{
                        if let userDict = user as? NSDictionary {
                            
                            let nome: String? = (userDict.object(forKey: "name") as AnyObject).value(forKey: "first") as! String
                            if (nome != nil){
                                 print("Nomes:----> \(nome)")
                                self.nameArray.append(nome!)
                            }
                            
                            if let email = userDict.value(forKey: "email") {
                                print("Email:----> \((email as? String)!))")
                            }
                        }
                    }
                }
                OperationQueue.main.addOperation({
                    self.showNames()
                })
            }
        }).resume()
    }

    func showNames(){
        for name in nameArray{
            print(" Nome: \(name) \n");
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
        let index = countryCodes.index(forKey: "JP")
        
        print("Country code for \(countryCodes[index!].value): '\(countryCodes[index!].key)'.")
        // Prints "Country code for Japan: 'JP'."
        
        getJsonFromUrl();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

