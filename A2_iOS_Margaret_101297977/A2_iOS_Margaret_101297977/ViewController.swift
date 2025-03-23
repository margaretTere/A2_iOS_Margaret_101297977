//
//  ViewController.swift
//  A2_iOS_Margaret_101297977
//
//  Created by Rita T on 2025-03-21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let context = appDelegate.persistentContainer.viewContext
        
       
      for i in 1...10 {
            initalDataLoad(i, context: context)
        }
   
    }
    
    func initalDataLoad(_ id: Int, context: NSManagedObjectContext) {
        
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
        
        newProduct.setValue(id, forKey: "productId")
        newProduct.setValue("Product #\(id)", forKey: "productName")
        newProduct.setValue("Added product #\(id)", forKey: "productDescription")
        newProduct.setValue(7.95+Double(id), forKey: "productPrice")
        newProduct.setValue("Supplier #\(id)", forKey: "productProvider")
        
        appDelegate.saveContext()
    }


}

