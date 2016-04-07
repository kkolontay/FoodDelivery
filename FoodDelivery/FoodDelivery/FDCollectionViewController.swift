//
//  FDCollectionViewController.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/3/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit

class FDCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var fetchData: FDFetchData?
    
    override func viewDidLoad() {
        fetchData = FDFetchData()
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        navigationController?.navigationBar.titleTextAttributes =
[NSForegroundColorAttributeName: UIColor.whiteColor(),  NSFontAttributeName: UIFont(name: "Arial", size: 27)!]
        self.title = "Takeaway menu"
        let width = CGRectGetWidth(view.frame) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width / 240 * 290)
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchData!.fetchCountItems();
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! FDCellCoolectionView
        cell.setImage((fetchData?.getImageAtIndex(indexPath.row))!)
        cell.setNameDish((fetchData?.getNameDishAtIndex(indexPath.row))!)
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("it's cool")
    }
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if segue!.identifier == "detailList" {
            let detailList: FDDetailListViewController = segue!.destinationViewController as! FDDetailListViewController
            let cell = sender as! UICollectionViewCell
           // detailList.setItemDataFor(<#T##item: MainDishes##MainDishes#>)
            let indexPath = self.collectionView.indexPathForCell(cell) //indexPathForSelectedRow()
            detailList.setItemDataFor((fetchData?.getItemAtIndex((indexPath?.row)!))!)
           // viewController.pinCode = self.exams[indexPath.row]
            
        }
        
    }
}
