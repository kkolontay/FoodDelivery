//
//  FDDetailCellDish.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/4/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit


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
    @IBAction func decrementCountOfDish(sender: AnyObject) {
    }
    @IBAction func incrementCountOfDish(sender: AnyObject) {
    }
    @IBAction func addOrder(sender: AnyObject) {
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
            nutsImage.hidden = !has
            hasNutsLabel.enabled = !has
    }
    func hasVegetarianField(has: Bool) {
        vegetarianImage.hidden = !has
        vegetarianLabel.enabled = !has
    }
    func fetchpriceLabel(price: Float) {
        priceLabel.text = String(format: "£ %.2f", price)
    }
    func fetchcountOfDishLambe(count: Int) {
        countOfDishLabel.text = String(format: "%d", count)
    }
}