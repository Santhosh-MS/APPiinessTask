//
//  APPiinessTaskTests.swift
//  APPiinessTaskTests
//
//  Created by admin on 9/23/20.
//  Copyright © 2020 admin. All rights reserved.
//

import XCTest
@testable import APPiinessTask

class APPiinessTaskTests: XCTestCase {
    var viewCtrl : ViewController!
    var viewModel : ViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewCtrl = ViewController()
        self.viewModel = ViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertNotNil(self.viewCtrl)
        XCTAssertNotNil(self.viewModel)
        XCTAssertNil(self.viewCtrl.tableView)
    }
    func testStudentRecodeTest () throws{
        if self.viewCtrl.studentRecord.count > 0 {
             XCTAssertNotNil(self.viewCtrl.studentRecord)
            XCTAssertTrue(self.viewCtrl.studentRecord.count > 0 )
        }else{
            XCTAssertNotNil(self.viewCtrl.studentRecord)
            XCTAssertFalse(self.viewCtrl.studentRecord.count > 0 )
        }
    }
    func testCodegetRecoder() throws {
        if self.viewModel.getStudentInfo().count > 0 {
              XCTAssertTrue(self.viewModel.getStudentInfo().count > 0 )
        }else{
            XCTAssertFalse(self.viewModel.getStudentInfo().count > 0 )
        }
    }
    
    func testViewModelStudentInfo() throws {
        XCTAssertNotNil(self.viewModel.studInfo)
    }
    
    //MARK:- code tested for allStudent DoB not a leap Year
    func testAllyearnotLeapYear() throws{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd"
        
          if self.viewModel.getStudentInfo().count > 0 {
            
            for stud in self.viewModel.getStudentInfo() {
                let dobStr = dateFormatter.string(from: stud.dob)
                print("dobStr : \(dobStr)")
                let dateArr : [String] = dobStr.components(separatedBy: "/")
                guard let year = Int(dateArr[0]) else{
                    return
                }
                
                XCTAssertTrue((year % 4) != 0)
            }
            
        }
    }
    
    //MARK:- tested  code based on studen DOB ascending order 
    func testDobOrderStudent() throws {
        let studInfo = self.viewModel.getStudentInfo()
        
        if studInfo.count > 0 {
            for i in 0..<studInfo.count - 1 {
                if i != studInfo.count  {
                    XCTAssertTrue(studInfo[i].dob < studInfo[i+1].dob )
                }
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
