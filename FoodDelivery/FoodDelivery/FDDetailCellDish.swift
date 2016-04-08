//
//  FDDetailCellDish.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/4/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit
import CoreData

protocol FDDetailListDelegate {
    func callWindow()
}
class FDDetailCellDish: UITableViewCell {
    
    @IBOutlet weak var nameDishLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var nutsImage: UIImageView!
    @IBOutlet weak var hasNutsLabel: UILabel!
    @IBOutlet weak var vegetarianImage: UIImageView!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countOfDishLabel: UILabel!
    @IBOutlet weak var distanceToImageView: NSLayoutConstraint!
    private var itemDish: ItemDish?
     var delegate: FDDetailListDelegate?
    @IBAction func decrementCountOfDish(sender: AnyObject) {
        if itemDish?.coutOfDish > 1 {
        itemDish?.coutOfDish = (itemDish?.coutOfDish)! - 1
        fetchcountOfDishLambe(Int((itemDish?.coutOfDish)!))
        }
        
    }
    @IBAction func incrementCountOfDish(sender: AnyObject) {
        itemDish?.coutOfDish = (itemDish?.coutOfDish)! + 1
        fetchcountOfDishLambe(Int((itemDish?.coutOfDish)!))
    }
    @IBAction func addOrder(sender: AnyObject) {
       let result =  FDInitCoreData.getManagedObjects("Order", predicate: "orderItemDish.name == %@", value: itemDish!.name)
        if result.count > 0 {
           let item = result.last as! Order
            item.quantity = item.quantity + (itemDish?.coutOfDish)!
        } else {
            let entity = NSEntityDescription.entityForName("Order", inManagedObjectContext: FDInitCoreData.managedContext)
            let order = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: FDInitCoreData.managedContext) as! Order
            order.quantity = (itemDish?.coutOfDish)!
            order.orderItemDish = itemDish
        }
        itemDish?.coutOfDish = 1
        do {
            try FDInitCoreData.managedContext.save()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        delegate?.callWindow()
    }
    func setItem(item: ItemDish) {
        itemDish = item
        setNameDishLable(item.name!)
        setDishImageViewCell(item.picture!)
        setDescriptionTextFieldCell(item.descriptionDish!)
        hasNutsField(item.hasNats)
        hasVegetarianField(item.vegeterian)
        fetchpriceLabel(item.price)
        fetchcountOfDishLambe(Int(item.coutOfDish))
    }
    func setNameDishLable(name: String) {
        nameDishLabel.text = name
    }
    func setDishImageViewCell(name: String) {
        dishImageView.image = FDGetPicture.getPicture(name)
    }
    func setDescriptionTextFieldCell(text: String) {
        descriptionTextField.text = text
    }
    func hasNutsField(has: Bool) {
            nutsImage.hidden = has
            hasNutsLabel.hidden = has
    }
    func hasVegetarianField(has: Bool) {
        vegetarianImage.hidden = has
        vegetarianLabel.hidden = has
    }
    func fetchpriceLabel(price: Float) {
        priceLabel.text = String(format: "£ %.2f", price)
    }
    func fetchcountOfDishLambe(count: Int) {
        countOfDishLabel.text = String(format: "%d", count)
    }
}