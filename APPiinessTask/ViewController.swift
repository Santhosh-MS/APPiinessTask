//
//  ViewController.swift
//  APPiinessTask
//
//  Created by admin on 9/23/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//MARK:- Class for listing student info
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    // Variable : ClassReferance
    @IBOutlet weak var tableView: UITableView!
    var studentRecord = [StudentModel]()
    let  viewModel = ViewModel()
    let dateFormatter = DateFormatter()
    
    //MARK:-func :Viewdid lodad method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(StudentCell.nib, forCellReuseIdentifier:StudentCell.identifier)
        self.dateFormatter.dateFormat  = "yyyy/MM/dd"
        
        self.studentRecord = self.viewModel.getStudentInfo()
        
        if self.studentRecord.count > 0 {
            self.tableView.reloadData()
        }
    }
    
//MARK:-func :Table view delegate method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentRecord.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: StudentCell.identifier, for: indexPath) as? StudentCell{
            let info = studentRecord[indexPath.row]
            let dates = dateFormatter.string(from: info.dob)
            cell.lblDob.text = dates
            cell.lblName.text = info.name
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
}

