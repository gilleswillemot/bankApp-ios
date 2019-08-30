//
//  BankTableViewController.swift
//  bankApp
//
//  Created by gilles willemot on 09/05/2019.
//  Copyright © 2019 gilles willemot. All rights reserved.
//

import UIKit
import BankProviderFrameworkiosX64

class BankTableViewController: UITableViewController {
    
    var bankProvider: IBankProvider = BankProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankProvider.getBanks().count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
            cell.textLabel?.text = "Bank Overview"
            cell.backgroundColor = .darkGray
            cell.textLabel?.textColor = .white
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bankCell", for: indexPath)
            
            // Configure the cell...
            let bank = bankProvider.getBanks()[indexPath.row - 1]
            
            cell.textLabel?.text = bank.name
            
            return cell
        }
    }
}
