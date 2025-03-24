
import UIKit
import CoreData

class ViewController: UIViewController, AddProductViewControllerDelegate {

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
        
        productId.isUserInteractionEnabled = false
        productName.isUserInteractionEnabled = false
        productDescription.isUserInteractionEnabled = false
        productPrice.isUserInteractionEnabled = false
        productProvider.isUserInteractionEnabled = false
        
        products = fetchAllProducts(context)
        updateUI()
        
    }
    
    func didAddNewProduct(_ product: Product) {
        products.append(product)
        totalProducts += 1
        updateUI()
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
        if products.count == 0 {
            return
        }
        productId.text = "\(products[currentProductIndex].productId)"
        productName.text = products[currentProductIndex].productName
        productDescription.text = products[currentProductIndex].productDescription
        productPrice.text = "\(products[currentProductIndex].productPrice)"
        productProvider.text = products[currentProductIndex].productProvider
        
        if currentProductIndex == 0 {
            btnPrev.isHidden = true
        } else {
            btnPrev.isHidden = false
        }
        
        if currentProductIndex == totalProducts-1 {
            btnNext.isHidden = true
        } else {
            btnNext.isHidden = false
        }
    }
    
    @IBAction func goPrev(_ sender: UIButton) {
        if currentProductIndex > 0 {
            currentProductIndex -= 1
            updateUI()
        }
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        if currentProductIndex < totalProducts-1 {
            currentProductIndex += 1
            updateUI()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllProducts" {
            let productList = segue.destination as? ProductListViewController
            productList?.products = products
        } else if segue.identifier == "showAddProduct" {
            let addProduct = segue.destination as? AddProductViewController
            addProduct?.products = products
            addProduct?.delegate = self
        } else if segue.identifier == "showSearch" {
            let searchProduct = segue.destination as? SearchProductViewController
            searchProduct?.products = products
        } else{
            fatalError( "Unknown segue identifier \(segue.identifier ?? "nil")")
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

