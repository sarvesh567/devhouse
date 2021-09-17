//
//  ViewController.swift
//  DevHouse
//
//  Created by Sarvesh Patel on 15/09/21.
//

import UIKit
import Firebase
import FirebaseFirestore
class HomeVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    var catetories = [CategoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: Identifier.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifier.CategoryCell)
        FireStoreService.shared.setCategoriesListner { category in
            self.catetories.append(category)
            print(self.catetories)
            self.collectionView.reloadData()
        }
       

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        FireStoreService.shared.listener.remove()
    }
    
    func onDocumentAdded(change: DocumentChange, category: CategoryModel){
        let newIndex = Int(change.newIndex)
        catetories.insert(category, at: newIndex)
        collectionView.insertItems(at: [IndexPath(item: newIndex, section: 0)])
        
    }
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(catetories.count)
        return catetories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.CategoryCell, for: indexPath) as? CategoryCell{
            cell.configureUI(categoryModel: catetories[indexPath.item])
           
            return cell
        }
        return UICollectionViewCell()
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 20) / 2
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}
