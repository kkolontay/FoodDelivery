//
//  FDOrderTableViewController.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDOrderTableViewController: UITableViewController {
    
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
