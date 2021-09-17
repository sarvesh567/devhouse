//
//  ProductVC.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import UIKit
import FirebaseFirestore
class ProductVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products = [ProductModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let product = ProductModel(name: "Swift", id: "43d45eefedw", category: "Language", price: 12.44, productDescription: "fweggjigbihrbgiubieubeigbuergbregbryge", imgURL: "https://media.istockphoto.com/photos/mount-hood-oregon-picture-id1268487061?b=1&k=20&m=1268487061&s=170667a&w=0&h=3fHYwaImlqUETcjCnSV7YO2-PzCFvaX6VSQaiGfWqpc=", timeStamp: Timestamp(), stock: 12, favorite: false)
        products.append(product)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifier.ProductCell, bundle: nil), forCellReuseIdentifier: Identifier.ProductCell)
    }
    
}
extension ProductVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.ProductCell) as? ProductCell {
            cell.configureCell(product: products[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
}
