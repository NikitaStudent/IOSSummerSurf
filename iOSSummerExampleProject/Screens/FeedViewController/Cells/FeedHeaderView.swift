//
//  FeedHeaderView.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 09.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class FeedHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.text = nil
    }

    func configure(title: String) {
        titleLabel.text = title
    }

}
