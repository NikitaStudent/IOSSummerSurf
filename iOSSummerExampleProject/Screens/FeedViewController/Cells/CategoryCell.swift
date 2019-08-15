//
//  CategoryCell.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 09.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(named: "headerImage")
        backgroundImage.layer.cornerRadius = 16.0
        backgroundImage.layer.masksToBounds = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Travel"
    }
    
    
}
