//
//  ESPImageCollectionViewCell.swift
//  ESPImages
//
//  Created by Kate on 11.09.17.
//  Copyright © 2017 Kate. All rights reserved.
//

import UIKit
import Kingfisher

class ESPImageCollectionViewCell: UICollectionViewCell {
    
    var imageModel: ImageModel! {
        didSet {
            let url = URL(string: imageModel.urlTn)
            imageView.kf.setImage(with: url)
           
            
        }
    }
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageNameLabel: UILabel!
    
    
    }
