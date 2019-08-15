//
//  FeedCategoriesCell.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 09.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class FeedCategoriesCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collections: [Collection] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(collections: [Collection]) {
        self.collections = collections
        collectionView.reloadData()
    }
    
}

extension FeedCategoriesCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        let currentCollection = collections[indexPath.row]
        cell.titleLabel.text = currentCollection.title
        if let url = currentCollection.photo?.urlString {
            cell.backgroundImage.image = nil
            cell.backgroundImage.loadImage(by: url)
        }
        return cell
    }
    
}
