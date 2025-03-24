//
//  AddProductViewController.swift
//  A2_iOS_Margaret_101297977
//
//  Created by Rita T on 2025-03-23.
//

import UIKit

protocol AddProductViewControllerDelegate: AnyObject {
    func didAddNewProduct(_ product: Product)
}


class AddProductViewController: UIViewController {

    var products: [Product]?
    
    weak var delegate: AddProductViewControllerDelegate?
    
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productProvider: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addProduct(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let newProduct = Product(context: appDelegate.persistentContainer.viewContext)
        newProduct.productId = Int16(products?.count ?? 0) + 1
        newProduct.productName = productName.text ?? ""
        newProduct.productProvider = productProvider.text ?? ""
        newProduct.productPrice = Double(productPrice.text ?? "") ?? 0
        newProduct.productDescription = productDescription.text
        
        appDelegate.saveContext()
        
        delegate?.didAddNewProduct(newProduct)
        navigationController?.popViewController(animated: true)
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
