//
//  FDFetchDataOrder.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDFetchDataOrder: NSObject {
    private var itemsOrder: [Order]?
    override init() {
    super.init()
        itemsOrder = FDInitCoreData.getManagedObjects("Order") as? [Order]
    }
    func fetchCountOfItems() -> Int {
        return (itemsOrder?.count)!
    }
    func fetchItemAtIndex(index: Int) -> Order {
        return itemsOrder![index]
    }
    func totalCost() -> Double {
        var total = 0.0
        for item in itemsOrder! {
            total = total + ( Double(item.quantity) * Double((item.orderItemDish?.price)!))
        }
        return total
    }
}
