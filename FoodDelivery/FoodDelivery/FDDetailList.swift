//
//  FDDetailList.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/4/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit


class FDDetailListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var itemForDisplaying: MainDishes?
    private var dataDetail: FDFetchDataDetailList?
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var viewBucket: UIView!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var buttonOrder: UIButton!
    private var dataOrder: FDFetchDataOrder?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),  NSFontAttributeName: UIFont(name: "Arial", size: 20)!]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.topItem?.title = ""
        self.title = itemForDisplaying?.name ?? "This is Dish"
        buttonOrder.layer.borderWidth = 1
        buttonOrder.layer.borderColor = UIColor.whiteColor().CGColor
        buttonOrder.layer.cornerRadius = 5
        dataOrder = FDFetchDataOrder()
        viewBucket.layer.opacity = 0.5
        if dataOrder?.totalCost() == 0 {
            viewBucket.hidden = true
        }
        totalCostLabel.text = String(format: "£ %.2f", (dataOrder?.totalCost())!)
    }
       override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       callWindow()

    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataDetail?.fetchItemsCoutn())!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellDish", forIndexPath: indexPath) as! FDDetailCellDish
        cell.setItem((dataDetail?.getItemAtIndex(indexPath.row))!)
        cell.delegate = self
        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == ((dataDetail?.fetchItemsCoutn())! - 1) {
            viewBucket.hidden = true
        }
        else {
            viewBucket.hidden = false
        }
    }
    func setItemDataFor(item: MainDishes) {
        itemForDisplaying = item
        let array = item.mainDishesToItemDish?.allObjects as! [ItemDish]
                dataDetail = FDFetchDataDetailList(items: array)
    }
}
extension FDDetailListViewController: FDDetailListDelegate {
    func callWindow() {
        dataOrder = FDFetchDataOrder()
        if dataOrder?.totalCost() != 0 {
            viewBucket.hidden = false
            totalCostLabel.text = String(format: "£ %.2f", (dataOrder?.totalCost())!)
        }
    }

}