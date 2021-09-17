//
//  ProductCell.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import UIKit
import Kingfisher
class ProductCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(product: ProductModel){
        if let url = URL(string: product.imgURL){
            productImage.kf.setImage(with: url)
        }
        productTitleLabel.text = product.name
        productPriceLabel.text = "$\(String(product.price))"
        
        
        
    }

    @IBAction func addToCartButtonPressed(_ sender: Any) {
    }
    @IBAction func favouriteButtonPressed(_ sender: Any) {
    }
}
