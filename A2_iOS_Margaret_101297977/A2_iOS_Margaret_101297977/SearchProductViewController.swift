//
//  SearchProductViewController.swift
//  A2_iOS_Margaret_101297977
//
//  Created by Rita T on 2025-03-23.
//

import UIKit

class SearchProductViewController: UIViewController {

    var products: [Product]?
    
    @IBOutlet weak var searchCriteria: UITextField!
    
    @IBOutlet weak var btnSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func searchProducts(_ sender: UIButton) {
        print("\(products![0].productDescription ?? "No products")")
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
