//
//  DBService.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 16/09/21.
//

import Foundation
import FirebaseFirestore

class FireStoreService{
    static let shared = FireStoreService()
    var listener: ListenerRegistration!
    private var db: Firestore!
    private var CATEGORY_COLLECTION = "category"
    private var FIRST_DOCUMENT = "4FYRteXptltpGhGqJVis"
    func setCategoriesListner(_ handler: @escaping (_ category: CategoryModel) -> ()) {
        db = Firestore.firestore()
        listener = db.collection("category").addSnapshotListener({ snapshot, error in
            if let e = error{
                print("\(e.localizedDescription)")
            }
            snapshot?.documentChanges.forEach({ change in
                let data = change.document.data()
                let category = CategoryModel.init(data: data)
                handler(category)
                switch change.type{
                case .added:
                    //HomeVC().onDocumentAdded(change: change, category: category)
                print("added new documents")
                case .modified:
                    self.onDocumentModified()
                case .removed:
                    self.onDocumentRemoved()
                }
            })
        })
        
    }
    func onDocumentModified() {
        
    }
    
    func onDocumentRemoved() {
        
    }
}
