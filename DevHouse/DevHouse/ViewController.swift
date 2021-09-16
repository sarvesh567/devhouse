//
//  ViewController.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 15/09/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var db: Firestore!
    var catetories = [CategoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
//        fectchDocuments()
//        fetchCollection()
        FireStoreService.shared.getDocument { category in
            print(category.name as Any)
            self.catetories.append(category)
        }
    }
    
    func fectchDocuments(){
        let docRef = db.collection("category").document("NYLYdmicR2cjjxMuDNWA")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data() else{return}
            let newCategory = CategoryModel.init(data: data)
            print(newCategory)
        }
    }
    
    func fetchCollection(){
        let collectionRef = db.collection("category")
        collectionRef.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else{return}
            for document in documents{
                print(document)
                 let data = document.data()
                let newCategory = CategoryModel.init(data: data)
                print(newCategory)
            }
        }
    }
}

