

import UIKit

class SearchProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var products: [Product]?
    var filteredProducts: [Product]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchCriteria: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction func searchProducts(_ sender: UIButton) {
        guard let searchText = searchCriteria.text?.lowercased(), !searchText.isEmpty
        else {
            filteredProducts = products ?? []
            tableView.reloadData()
            return
        }
        
        filteredProducts = products?.filter { product in
            let matchesName = product.productName?.lowercased().contains(searchText) ?? false
            let matchesDescription = product.productDescription?.lowercased().contains(searchText) ?? false
            return matchesName || matchesDescription
            
        }
        
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        let product = filteredProducts?[indexPath.row]
        cell.textLabel?.text = product?.productName ?? "No name"
        cell.detailTextLabel?.text = product?.productDescription ?? "No description"
            return cell
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
