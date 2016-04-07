//
//  FDFetchDataDetailList.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDFetchDataDetailList {
    private var itemsForDisplaying: [ItemDish]?
    init(items: [ItemDish]) {
        itemsForDisplaying = items
    }
    
    func fetchItemsCoutn() -> Int {
        return itemsForDisplaying?.count ?? 0
    }
    func getItemAtIndex(index: Int) -> ItemDish {
       return itemsForDisplaying != nil ? itemsForDisplaying![index] :  ItemDish()
    }
}
