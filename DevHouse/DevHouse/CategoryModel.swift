//
//  CategoryModel.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
struct CategoryModel {
    var name: String?
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
    }
}
