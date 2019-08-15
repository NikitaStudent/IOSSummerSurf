//
//  FeedHeaderCell.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 09.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class FeedHeaderCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let height: CGFloat = 250
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureHeaderImage()
        configureLabels()
        selectionStyle = .none
    }
    
    // MARK: - Configuration]
    
    

    func handleScroll(offset: CGFloat) {
        clipsToBounds = offset >= 0
        heightConstraint.constant = Constants.height - offset
    }
    
    func configureHeaderImage() {
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.image = UIImage(named: "headerImage")
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }

    func configureLabels() {
        titleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .semibold)
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        titleLabel.text = "Photos for everyone"
        
        authorLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        authorLabel.textColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1)
        authorLabel.numberOfLines = 1
        authorLabel.textAlignment = .center
        authorLabel.text = "Photo by Marcelo Cidrack"
    }
    
}
