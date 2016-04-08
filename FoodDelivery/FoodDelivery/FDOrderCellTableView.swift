//
//  FDOrderCellTableView.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/7/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

protocol FDOrderDelegate {
    func reloadDataDeleteItem()
}

class FDOrderCellTableView: UITableViewCell {
    
    @IBOutlet weak var imageViewDish: UIImageView!
    @IBOutlet weak var nameDishLabel: UILabel!
    @IBOutlet weak var imageNats: UIImageView!
    @IBOutlet weak var hasNutsLabel: UILabel!
    @IBOutlet weak var ImageVegetarian: UIImageView!
    @IBOutlet weak var hasVegetarianLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var totalPriceDishLabel: UILabel!
    var delegate: FDOrderDelegate?
    private var itemCell: Order?
    private var count: Int?
    
    func setItemOrder(item: Order) {
        itemCell = item
        count = Int((itemCell?.quantity)!)
        fetchImageDish((itemCell?.orderItemDish?.picture)!)
        fetchNameDish((itemCell?.orderItemDish?.name)!)
        fetchNatsOrder((itemCell?.orderItemDish?.hasNats)!)
        fetchVegetarianOrder((itemCell?.orderItemDish?.vegeterian)!)
        fetchPriceOrder(Double((itemCell?.orderItemDish?.price)!))
        fetchCountOrder(Int((itemCell?.quantity)!))
        fetchTotalPriceOfOrder((Double((itemCell?.quantity)!) * Double((itemCell?.orderItemDish?.price)!)))
        
    }
    func fetchImageDish(picture: String) {
        imageViewDish.image = FDGetPicture.getPicture(picture)
    }
    func fetchNameDish(name: String) {
        nameDishLabel.text = name
    }
    func fetchNatsOrder(has: Bool) {
        imageNats.hidden = has
        hasNutsLabel.hidden = has
    }
    func fetchVegetarianOrder(has: Bool) {
        ImageVegetarian.hidden = has
        hasVegetarianLabel.hidden = has
    }
    func fetchPriceOrder(price: Double) {
        priceLabel.text = String(format: "£ %.2f", price)
    }
    func fetchCountOrder(count: Int) {
        countLabel.text = String(format: "%d", count)
    }
    func fetchTotalPriceOfOrder(price: Double) {
        totalPriceDishLabel.text = String(format: "%.2f", price)
    }
    @IBAction func decreaseCountDish(sender: AnyObject) {
        if itemCell?.quantity > 1 {
        itemCell?.quantity = (itemCell?.quantity)! - 1
            count = count! - 1
        do {
            try FDInitCoreData.managedContext.save()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
            fetchCountOrder(count!)
        fetchTotalPriceOfOrder((Double((itemCell?.quantity)!) * Double((itemCell?.orderItemDish?.price)!)))
             delegate?.reloadDataDeleteItem()
        }
    }
    @IBAction func increaseCountDish(sender: AnyObject) {
        itemCell?.quantity = (itemCell?.quantity)! + 1
        count = count! + 1

        do {
            try FDInitCoreData.managedContext.save()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        fetchCountOrder(count!)
        fetchTotalPriceOfOrder((Double((itemCell?.quantity)!) * Double((itemCell?.orderItemDish?.price)!)))
         delegate?.reloadDataDeleteItem()
    }
    
    @IBAction func deleteOrderItem(sender: AnyObject) {
        FDInitCoreData.managedContext.deleteObject(itemCell!)
        do {
            try FDInitCoreData.managedContext.save()
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        delegate?.reloadDataDeleteItem()
    }
}
