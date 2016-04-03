//
//  FDCellCollectionView.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/3/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDCellCoolectionView: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodTypeLabel: UILabel!
    
    
    func setImage(image:UIImage) {
        imageView.image = image
    }
    
    func setNameDish(name: String) {
        foodTypeLabel.text = name
    }
}