//
//  FDDetailList.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/4/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit


class FDDetailListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),  NSFontAttributeName: UIFont(name: "Arial", size: 27)!]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.topItem?.title = ""
        self.title = "Takeaway menu"
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellDish", forIndexPath: indexPath) as! FDDetailCellDish
        return cell
    }
}