//
//  Product.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
import FirebaseFirestore
struct  ProductModel {
    var name: String
    var id: String
    var category: String
    var price: Double
    var productDescription: String
    var imgURL: String
    var timeStamp: Timestamp
    var stock: Int
    var favorite: Bool  
}
