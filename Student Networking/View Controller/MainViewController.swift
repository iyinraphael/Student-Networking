//
//  MainViewController.swift
//  Student Networking
//
//  Created by Iyin Raphael on 12/3/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchRecipies { (students, error) in
            if let error = error {
                NSLog("Error occured \(error)")
                return
            }
            self.students = students ?? []
        }
    }
    
    @IBAction func sort(_ sender: Any) {
        updateSort()
    }
    
    private func updateSort() {
        DispatchQueue.main.async {
            let sortedStudents: [Student]
            if self.sortSelector.selectedSegmentIndex == 0 {
                sortedStudents = self.students.sorted { $0.firstName < $1.firstName}
            } else {
                sortedStudents = self.students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "" ) }
            }
            self.studentTableViewController.students = sortedStudents
        }
        
    }
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            let studentTableVC = segue.destination as! StudentTableViewController
            studentTableViewController = studentTableVC
        }
    }
    
    private var studentTableViewController: StudentTableViewController!
    private let networkClient = NetworkClient()
    private var students: [Student] = [] {
    didSet {
            updateSort()
        }
    }
}
