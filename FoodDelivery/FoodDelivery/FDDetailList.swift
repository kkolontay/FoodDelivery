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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),  NSFontAttributeName: UIFont(name: "Arial", size: 20)!]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.topItem?.title = ""
        self.title = itemForDisplaying?.name ?? "This is Dish"
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
        return cell
    }
    func setItemDataFor(item: MainDishes) {
        itemForDisplaying = item
        let array = item.mainDishesToItemDish?.allObjects as! [ItemDish]
                dataDetail = FDFetchDataDetailList(items: array)
    }
}