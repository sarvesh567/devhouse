//
//  CategoryCell.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import UIKit
import Kingfisher
class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 6.0
    }
    
    func configureUI(categoryModel: CategoryModel){
        categoryLabel.text = categoryModel.name
        if let url = URL(string: categoryModel.imgUrl){
            categoryImage.kf.setImage(with: url)
        }
    }

}
