//
//  Task+CoreDataProperties.swift
//  PlannerIOS
//
//  Created by Matthew Song on 4/11/22.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?
    @NSManaged public var time: String?
    @NSManaged public var planner: Planner?

}

extension Task : Identifiable {

}
