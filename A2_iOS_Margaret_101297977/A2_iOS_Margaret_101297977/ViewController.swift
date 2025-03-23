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
        
        
        //      for i in 1...10 {
        //            initalDataLoad(i, context: context)
        //        }
        
        fetchAllProducts(context)
        
    }
        
    func fetchAllProducts(_ context: NSManagedObjectContext)  {
            
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            do {
                let results = try context.fetch(request)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let productId = result.value(forKey: "productId") as? Int {
                            print(productId)
                        }
                        if let productName = result.value(forKey: "productName") as? String {
                            print(productName)
                        }
                        if let productDescription = result.value(forKey: "productDescription") as? String {
                            print(productDescription)
                        }
                        if let productPrice = result.value(forKey: "productPrice") as? Double {
                            print(productPrice)
                        }
                        if let productProvider = result.value(forKey: "productProvider") as? String {
                            print(productProvider)
                        }
                    }
                    
                }
            } catch {
                print("Fetch failed: \(error)")
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

