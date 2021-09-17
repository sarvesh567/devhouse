//
//  CategoryModel.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
import FirebaseFirestore
struct CategoryModel {
    var name: String
    var id: String
    var imgUrl: String
    var timeStamp: Timestamp
    var isActive: Bool = true
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.imgUrl = data["imgUrl"] as? String ?? ""
        self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
        self.isActive = data["isActive"] as? Bool ?? false
    }
    
}
