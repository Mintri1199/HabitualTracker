//
//  HabitImageCollectionViewCell.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/26/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "habitImageCell"
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setImage(image: UIImage) {
        self.habitImage.image = image
    }

    @IBOutlet weak var habitImage: UIImageView!
    
    
    
}
