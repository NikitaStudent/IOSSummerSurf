//
//  Collection+CoreDataProperties.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 13/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//
//

import Foundation
import CoreData


extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var photo: Photo?

}
