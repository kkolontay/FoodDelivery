//
//  FDFetchData.swift
//  FoodDelivery
//
//  Created by kkolontay on 4/3/16.
//  Copyright © 2016 kkolontay.test.com. All rights reserved.
//

import UIKit
import CoreData

class FDFetchData: NSObject {
    private var images: [UIImage]?
    private var nameDish: [String]?
    override init() {
        super.init()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        images = [UIImage]()
        nameDish = [String]()
        let fetchRequest = NSFetchRequest(entityName: "MainDishes")
        do {
            if let results = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                for result in results {
                    if let itemNameDishe = result.valueForKey("name") as? String, let nameImage = result.valueForKey("nameOfFilePicture") as? String {
                        nameDish?.append(itemNameDishe)
                        images?.append(getImage(nameImage))
                    }
                }
            }
        } catch {
            print ("Error fetched request")
        }
    }
  private  func getImage(imageName: String) -> UIImage {
        let urlPath = NSBundle.mainBundle().pathForResource(imageName, ofType: nil)
        return UIImage(contentsOfFile: urlPath!)!
    }
    func getImageAtIndex(index: Int) -> UIImage {
        return images![index]
    }
    func getNameDishAtIndex(index: Int) -> String {
        return nameDish![index]
    }
    func fetchCountItems() -> Int{
        return (images?.count)!
    }
}
