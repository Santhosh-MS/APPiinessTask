//
//  StudentModel.swift
//  APPiinessTask
//
//  Created by admin on 9/23/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation


class StudentModel {
    var name = String()
    var dob = Date()
    init(name : String , dob : Date) {
        self.name = name
        self.dob = dob
    }
}
