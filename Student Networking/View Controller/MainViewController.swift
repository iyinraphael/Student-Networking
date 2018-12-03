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
            studentTableViewController.students = students
        }
    }
}
