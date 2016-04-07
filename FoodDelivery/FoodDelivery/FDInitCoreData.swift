//
//  FDInitCoreData.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/6/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit
import CoreData

class FDInitCoreData: NSObject {
    let nameFileFirstScreen = ["dessert", "starter", "chickenLamb", "soup", "salad"]
    let nameLabelFirstScreen = ["Desserts", "Starters", "Chicken and Lamb", "Soup", "Salads"]
    let nameFileSecondScreen = ["chicken_salad", "chicken_leg", "chicken_grilled", "chicken_cebab", "chichen_fly"]
    let descriptionSecondScreen = [
                                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate",
                                   "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens",
                                   "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui",
                                   "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects,",
                                   "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary"
                                    ]
    let priceOfDish = [12.34, 8.23, 4.20, 10.48, 5.99]
    let nameOfDishSecondScreen = [ "Salad with chicken", "Spicy chicken's leg", "Chicken on the grill", "Cebab of chicken", "Sweet chicken's wings"]
    static let managedContext: NSManagedObjectContext = {
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let myManagedContext = applicationDelegate.managedObjectContext
        return myManagedContext
    }()
    static func getManagedObjects(entityNameEnter: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest(entityName: entityNameEnter)
        var result = [NSManagedObject]()
        do {
            result = try FDInitCoreData.managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        } catch let error as NSError {
            print( error.localizedDescription)
        }
        return result
    }
    override init() {
        super.init()
        let result = FDInitCoreData.getManagedObjects("MainDishes")
         if result.count != 0 {
            let results = result as! [MainDishes]
            for item in results {
                for itemDish in item.mainDishesToItemDish! {
                    (itemDish as! ItemDish).coutOfDish = 1
                }
            }
            deleteOrder()
            do {
            try FDInitCoreData.managedContext.save()
            } catch let error as NSError {
                print (error.localizedDescription)
            }
            return
        }
        for i in 0 ..< nameFileFirstScreen.count {
            let entity = NSEntityDescription.entityForName("MainDishes", inManagedObjectContext: FDInitCoreData.managedContext)
            let dish = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: FDInitCoreData.managedContext) as! MainDishes
            if nameLabelFirstScreen[i] == "Chicken and Lamb" {
                dish.mainDishesToItemDish = setDishes(dish)
            }
            dish.nameOfFilePicture = nameFileFirstScreen[i]
            dish.name = nameLabelFirstScreen[i]
        }
        
        do {
       try FDInitCoreData.managedContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    func setDishes(itemMainDish: MainDishes) -> NSMutableSet {
        let set = NSMutableSet()
        for i in 0 ..< nameFileSecondScreen.count {
        let entity = NSEntityDescription.entityForName("ItemDish", inManagedObjectContext: FDInitCoreData.managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: FDInitCoreData.managedContext) as! ItemDish
            if i == 0 {
                item.hasNats = true
                item.vegeterian = false
            } else if i == 1 {
                item.hasNats = false
                item.vegeterian = true
            } else if  i == 2 {
                item.hasNats = true
                item.vegeterian = true
                
            } else {
                item.hasNats = false
                item.vegeterian = false
            }
            item.name = nameOfDishSecondScreen[i]
            item.descriptionDish = descriptionSecondScreen[i]
            item.picture = nameFileSecondScreen[i]
            item.price = Float(priceOfDish[i])
            item.itemDishToMainDishes = itemMainDish
            item.coutOfDish = 1
            set.addObject(item)
        }
        return set
    }
    func deleteOrder() {
                let result = FDInitCoreData.getManagedObjects("Order")
               if result.count != 0 {
            for itemOrder in result {
                FDInitCoreData.managedContext.deleteObject(itemOrder)
            }
        }
    }
}
