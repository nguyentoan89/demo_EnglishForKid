//
//  TableViewController.swift
//  Demo_English4Kids
//
//  Created by Nguyen Cong Toan on 6/6/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dictList = ["Animals":"animals.jpeg","Fruits":"fruits"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return dictList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var arrayKey = Array(dictList.keys)
        cell.textLabel?.text = arrayKey[indexPath.row]
    cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail")
        {
            let detail = segue.destination as! DetailTableViewController
            let selectRowIndex: IndexPath = self.tableView.indexPathForSelectedRow!
            let selectCell: UITableViewCell = self.tableView.cellForRow(at: selectRowIndex)!
            detail.stringTitle = selectCell.textLabel?.text
        }
    }

  }
