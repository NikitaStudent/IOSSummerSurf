//
//  CollectionEnrty.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import Foundation


struct CollectionEntry: Codable{
    let id: Int
    let title: String
    let description: String?
    let cover_photo: PhotoEntry
    
}
