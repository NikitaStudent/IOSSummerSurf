//
//  ImageTableCell.swift
//  iOSSummerExampleProject
//
//  Created by Alexander Filimonov on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updatePhoto()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        updatePhoto()
    }
    
    func updatePhoto() {
        guard let imgURL = self.photo?.urlString else {
            return
        }
        customImageView?.loadImage(by: imgURL)
    }
}
