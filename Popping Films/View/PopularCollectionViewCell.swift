//
//  PopularCollectionViewCell.swift
//  Popping Films
//
//  Created by rsbj on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    static let cellIdentifier = "popularCell"

    func setup(title:String, image:UIImage){
        titleLabel.text = title
        imageView.image = image
    }
    
}
