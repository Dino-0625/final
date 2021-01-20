//
//  Cofff+CoreDataProperties.swift
//  final
//
//  Created by User12 on 2021/1/8.
//
//

import Foundation
import CoreData


extension Cofff {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cofff> {
        return NSFetchRequest<Cofff>(entityName: "Cofff")
    }

    @NSManaged public var lalala: String?

}

extension Cofff : Identifiable {

}
