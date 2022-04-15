//
//  Planner+CoreDataProperties.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/11/22.
//
//

import Foundation
import CoreData


extension Planner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planner> {
        return NSFetchRequest<Planner>(entityName: "Planner")
    }

    @NSManaged public var name: String?
    @NSManaged public var task: Task?

}

extension Planner : Identifiable {

}
