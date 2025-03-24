
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
        
        if productName.text?.isEmpty ?? true {
            showErrowMessage("Product name is required")
            return
        }
        
        if productPrice.text?.isEmpty ?? true {
            showErrowMessage("Product price is required")
            return
        }
        
        if productProvider.text?.isEmpty ?? true {
            showErrowMessage("Product provider is required")
            return
        }
        
        if productDescription.text?.isEmpty ?? true {
            showErrowMessage("Product description is required")
            return
        }
        
        
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
    
    func showErrowMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
            
        
        
    }
  
         
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
