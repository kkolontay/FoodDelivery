//
//  ItemDish+CoreDataProperties.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ItemDish {

    @NSManaged var descriptionDish: String?
    @NSManaged var hasNats: Bool
    @NSManaged var name: String?
    @NSManaged var picture: String?
    @NSManaged var price: Float
    @NSManaged var vegeterian: Bool
    @NSManaged var coutOfDish: Int16
    @NSManaged var itemDishOrder: Order?
    @NSManaged var itemDishToMainDishes: MainDishes?

}
