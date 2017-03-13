//
//  DemoEntity+CoreDataProperties.swift
//  ios-magicalrecord-demo
//
//  Created by k_motoyama on 2017/03/14.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import CoreData


extension DemoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DemoEntity> {
        return NSFetchRequest<DemoEntity>(entityName: "DemoEntity");
    }

    @NSManaged public var demoID: Int16
    @NSManaged public var demoItem: String?

}
