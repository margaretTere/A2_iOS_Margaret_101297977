//
//  ViewController.swift
//  A2_iOS_Margaret_101297977
//
//  Created by Rita T on 2025-03-21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var productId: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productProvider: UITextField!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var currentProductIndex: Int = 0
    var products: [Product] = []
    var totalProducts: Int = 0
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let context = appDelegate.persistentContainer.viewContext
        
        
        //      for i in 1...10 {
        //            initalDataLoad(i, context: context)
        //        }
        
        products = fetchAllProducts(context)
        
    }
        
    func fetchAllProducts(_ context: NSManagedObjectContext) -> [Product] {
            
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            let products = try context.fetch(request)
            totalProducts = products.count
            print(products)
            return products
        } catch {
            fatalError("Fetch failed: \(error)")
        }
      
    }
    
    func updateUI() {
        
    }
    
    @IBAction func goPrev(_ sender: UIButton) {
    }
    
    @IBAction func goNext(_ sender: UIButton) {
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

