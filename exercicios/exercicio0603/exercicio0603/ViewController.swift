//
//  ViewController.swift
//  exercicio0603
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ViewController: UIViewController {
    var posts = [Post]()
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    func getDocumentsURL() -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        } else {
            fatalError("Could not retrieve documents directory")
        }
    }
    
    func savePostsToDisk(posts: [Post]) {
        // 1. Create a URL for documents-directory/posts.json
        let url = getDocumentsURL().appendingPathComponent("posts.json")
        // 2. Endcode our [Post] data to JSON Data
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(posts)
            // 3. Write this data to the url specified in step 1
            try data.write(to: url, options: [])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getPostsFromDisk() -> [Post] {
        // 1. Create a url for documents-directory/posts.json
        let url = getDocumentsURL().appendingPathComponent("posts.json")
        let decoder = JSONDecoder()
        do {
            // 2. Retrieve the data on the file in this path (if there is any)
            let data = try Data(contentsOf: url, options: [])
            // 3. Decode an array of Posts from this Data
            let posts = try decoder.decode([Post].self, from: data)
            return posts
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getPosts(for userId: Int, completion: ((Result<[Post]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/posts"
        let userIdItem = URLQueryItem(name: "userId", value: "\(userId)")
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    
                    do {
                        let posts = try decoder.decode([Post].self, from: jsonData)
                        completion?(.success(posts))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts(for: 1) { (result) in
            switch result {
            case .success(let posts):
                self.posts = posts
                
                dump(self.posts)
            case .failure(let error):
                fatalError("error: \(error.localizedDescription)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

