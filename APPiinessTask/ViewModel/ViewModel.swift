//
//  ViewModel.swift
//  APPiinessTask
//
//  Created by admin on 9/23/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class ViewModel  {
    let studInfo  = [["name":"Sladdar","dob":"1992/01/20"],["name":"Moghul Kahn","dob":"1989/11/12"],["name":"Invoker","dob":"1890/04/21"],["name":"Skogul","dob":"1952/ 05/10"],["name":"Silencer","dob":"2000/04/23"],["name":"Tom","dob":"2002/11/01"],["name":"Jac k","dob":"1982/12/25"],["name":"Darion","dob":"1988/12/07"],["name":"Beth","dob":"1986/06/22"] ,["name":"Garo","dob":"1953/12/13"],["name":"Deva","dob":"1946/07/14"],["name":"Leo","dob":"2003/08/08"],["name":"Fran","dob":"1996/11/18"],["name":"Vero","dob":"2001/01/23"],["name":"Ali cia","dob":"2003/02/02"],["name":"Bernard","dob":"1994/10/23"],["name":"Shannon","dob":"2001/ 01/19"],["name":"Herne","dob":"1994/01/06"],["name":"Miho","dob":"1967/10/03"]] as [[String : String]]
    
    var studentArray = [StudentModel]()
    let dateFormatter = DateFormatter()
    
    //MARK:- getSorted & remove leapYear student recodr
    func getStudentInfo() -> [StudentModel]  {
        self.dateFormatter.dateFormat  = "yyyy/MM/dd"
        for  stud in studInfo {
            let name = stud["name"] ?? ""
            let dob = stud["dob"] ?? ""
            let dataArr : [String] = dob.components(separatedBy: "/")
            if (Int(dataArr[0])! % 4) != 0 {
                let date  = dateFormatter.date(from: dob)
                let dateStud = StudentModel(name: name, dob: date!)
                studentArray.append(dateStud)
            }
        }
        
        let finalSort = studentArray.sorted(by: { $0.dob.compare($1.dob) == .orderedAscending})
        if finalSort.count > 0 {
            return finalSort
        }else{
            return []
        }
    }
    
}

