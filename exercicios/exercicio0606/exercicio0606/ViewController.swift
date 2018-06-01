//
//  ViewController.swift
//  exercicio0606
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct GitHub: Codable {
        
        let name: String?
        let location: String?
        let followers: Int?
        let avatarUrl: URL?
        let repos: Int?
        
        private enum CodingKeys: String, CodingKey {
            case name
            case location
            case followers
            case repos = "public_repos"
            case avatarUrl = "avatar_url"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gitUrl = URL(string: "https://api.github.com/users/jacksonfdam") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHub.self, from: data)
                print(gitData.name ?? "Empty Name")
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

