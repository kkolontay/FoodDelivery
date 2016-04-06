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
    @IBAction func decrementCountOfDish(sender: AnyObject) {
    }
    @IBAction func incrementCountOfDish(sender: AnyObject) {
    }
    @IBAction func addOrder(sender: AnyObject) {
    }
}