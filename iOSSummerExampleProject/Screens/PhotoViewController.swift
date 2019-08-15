//
//  PhotoViewController.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 08.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoWrapView: UIView!
    @IBOutlet weak var imageViewWrapView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.designDark()

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "close"),
            style: .plain,
            target: self,
            action: #selector(closeClicked)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "share"),
            style: .plain,
            target: self,
            action: #selector(shareClicked)
        )
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc
    private func closeClicked() {
        dismiss(animated: true, completion: nil)
    }

    @objc
    private func shareClicked() {
        // share
    }

}
