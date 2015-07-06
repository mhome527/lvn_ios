//
//  TblVietFR.swift
//  lvn
//
//  Created by admin on 4/27/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import Foundation
import CoreData

class TblVietFR: NSManagedObject {

    @NSManaged var default_word: String
    @NSManaged var img: String
    @NSManaged var kind: NSNumber
    @NSManaged var level: NSNumber
    @NSManaged var o1: String
    @NSManaged var o2: String
    @NSManaged var vi: String

}
