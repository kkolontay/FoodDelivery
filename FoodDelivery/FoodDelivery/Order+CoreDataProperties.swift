//
//  Order+CoreDataProperties.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/6/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Order {

    @NSManaged var quantity: NSNumber?
    @NSManaged var orderItemDish: ItemDish?

}
