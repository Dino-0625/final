//
//  PlayerIDDD+CoreDataProperties.swift
//  final
//
//  Created by User12 on 2021/1/8.
//
//

import Foundation
import CoreData


extension PlayerIDDD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerIDDD> {
        return NSFetchRequest<PlayerIDDD>(entityName: "PlayerIDDD")
    }

    @NSManaged public var playerid: String?
    @NSManaged public var player_lname: String?
    @NSManaged public var player_fname: String?
    @NSManaged public var player_url: String?
    @NSManaged public var player_jersey: String?
}

extension PlayerIDDD : Identifiable {

}
