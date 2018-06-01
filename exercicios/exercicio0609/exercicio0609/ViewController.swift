//
//  ViewController.swift
//  exercicio0609
//
//  Created by Jackson on 01/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var itemsData: [Usuario] = [Usuario]()
    let cellReuseIdentifier = "TableViewCellUsuario"
    let api_url = "https://randomuser.me/api/?results=10";
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.addSubview(self.refreshControl)
        tableView.register(UINib(nibName: "TableViewCellUsuario", bundle: nil), forCellReuseIdentifier: "TableViewCellUsuario")
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    fileprivate func loadData() {
        
        let url = NSURL(string: api_url)
        
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "results")!)
                self.itemsData.removeAll()
                
                if let results = jsonObj!.value(forKey: "results") as? NSArray {
                    for user in results{
                        if let userDict = user as? NSDictionary {
                            let usuario:Usuario = Usuario()
                            
                            let nome: String? = (userDict.object(forKey: "name") as AnyObject).value(forKey: "first") as! String
                            if (nome != nil){
                                usuario.name = nome!
                            }
                            
                            if let email = userDict.value(forKey: "email") {
                                usuario.email = email as! String
                            }
                            
                            let picture: String? = (userDict.object(forKey: "picture") as AnyObject).value(forKey: "large") as! String
                            if (picture != nil){
                                usuario.profilePic = picture!
                            }
                            self.itemsData.append(usuario)
                            
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }).resume()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        loadData()
        refreshControl.endRefreshing()
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(NSStringFromClass(Usuario.self))
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableViewCellUsuario
        let item = self.itemsData[indexPath.row]
        print(" cellForRowAt Posição = \(indexPath.row) nome = # \(item.name) email: \(item.email)")
        
        cell.nome?.text = item.name
        cell.email?.text = item.email
        cell.foto.loadImageUsingCache(withUrl: item.profilePic)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

