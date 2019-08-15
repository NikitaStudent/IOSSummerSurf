//
//  Photo+CoreDataProperties.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 13/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var id: String?
    @NSManaged public var urlString: String?
    @NSManaged public var collection: NSSet?

}

