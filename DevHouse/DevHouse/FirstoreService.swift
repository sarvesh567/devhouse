//
//  DBService.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
import Firebase
class FireStoreService{
    static let shared = FireStoreService()
    private var db: Firestore!
    private var CATEGORY_COLLECTION = "category"
    private var FIRST_DOCUMENT = "4FYRteXptltpGhGqJVis"
    func getDocument(handler: @escaping (_ documentCompletion: CategoryModel) -> ()) {
        db = Firestore.firestore()
        let docRef = db.collection(CATEGORY_COLLECTION).document(FIRST_DOCUMENT)
        docRef.getDocument { snap, error in
            guard let data = snap?.data() else{return}
            handler(CategoryModel.init(data: data))
        }
    }
}
