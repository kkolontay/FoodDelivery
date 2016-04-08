//
//  FDOrderTableViewController.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var buttonOrder: UIButton!
    @IBOutlet weak var tableViewOrder: UITableView!
    private var dataOrder:FDFetchDataOrder?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOrder.layer.borderWidth = 1
        buttonOrder.layer.borderColor = UIColor.whiteColor().CGColor
        buttonOrder.layer.cornerRadius = 5
        dataOrder = FDFetchDataOrder()
        totalPriceLabel.text = String(format: "£ %.2f", (dataOrder?.totalCost())!)
    }
      func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataOrder?.fetchCountOfItems())!
    }
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellOrder", forIndexPath: indexPath) as! FDOrderCellTableView
        cell.delegate = self
        cell.setItemOrder((dataOrder?.fetchItemAtIndex(indexPath.row))!)
        return cell
    }
    
    
    
}
extension FDOrderViewController: FDOrderDelegate {
    func reloadDataDeleteItem() {
        dataOrder = FDFetchDataOrder()
        tableViewOrder.reloadData()
        totalPriceLabel.text = String(format: "£ %.2f", (dataOrder?.totalCost())!)
    }
}
