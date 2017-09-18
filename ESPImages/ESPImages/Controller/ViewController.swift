//
//  ViewController.swift
//  ESPImages
//
//  Created by Kate on 11.09.17.
//  Copyright © 2017 Kate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "\(ESPImageCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ESPImageCollectionViewCell.self)")
        }
    }
    
    var images: [ImageModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getModels { (images, error) in
            if let images = images {
                self.images = images
                self.collectionView.reloadData()
            }
        }
    }
    
}
extension  ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ESPImageCollectionViewCell.self)", for: indexPath) as! ESPImageCollectionViewCell
        cell.imageModel = images[indexPath.row]
        cell.imageNameLabel.text = images[indexPath.row].title
        return cell
    }
}

//extension  ViewController: UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch menuItems[indexPath.row].type {
//        case .address:
//            mapAction(self)
//        case .menuGroup:
//            if let number = menuItems[indexPath.row].groupNumber {
//                showMenu(for: number)
//            }
//        }
//    }
//}

extension  ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        tempLabel.text = menuItems[indexPath.row].title.uppercased()
//        let width = tempLabel.intrinsicContentSize.width > minimumCellWidth ? tempLabel.intrinsicContentSize.width : minimumCellWidth
        return CGSize(width: 150, height: 150)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//        let numberOfItems = CGFloat(collectionView.numberOfItems(inSection: section))
//        let combinedItemWidth = commonItemsWidth() + ((numberOfItems - 1)  * flowLayout.minimumInteritemSpacing)
//        let padding = (collectionView.frame.width - combinedItemWidth) / 2
//        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
//    }
//    
//    func commonItemsWidth() -> CGFloat {
//        return menuItems.reduce(0) { result, item in
//            tempLabel.text = item.title.uppercased()
//            return result + (tempLabel.intrinsicContentSize.width > minimumCellWidth ? tempLabel.intrinsicContentSize.width : minimumCellWidth)
//        }
//    }
}




