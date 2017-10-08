//
//  DetailTableViewController.swift
//  Demo_English4Kids
//
//  Created by Nguyen Cong Toan on 6/6/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
import Darwin

class DetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = stringTitle
        self.creatDataWithName(stringTitle)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }
    
    func creatDataWithName(_ title: String)
    {
        var path: String = ""
        if (title == "Fruits")
        {
            path  = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if (title == "Animals")
        {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys as NSArray
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayKeys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key: String = arrayKeys[indexPath.row] as! String
        
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
    }
    
    

   
}
