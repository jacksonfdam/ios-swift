//
//  ViewController.swift
//  exercicio0506
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a FileManager instance
        let fileManager = FileManager.default
        
        // Create 'subfolder' directory
        do {
            try fileManager.createDirectory(atPath: "subfolder", withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        // Delete 'subfolder' folder
        do {
            try fileManager.removeItem(atPath: "subfolder")
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        // Get current directory path
        
        let path = fileManager.currentDirectoryPath
        print(path)
        
        // Get contents in directory: '.' (current one)
        do {
            let files = try fileManager.contentsOfDirectory(atPath: ".")
            print(files)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        // Get temporary directory path
        let tempPath = NSTemporaryDirectory() as String
        print(tempPath)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

