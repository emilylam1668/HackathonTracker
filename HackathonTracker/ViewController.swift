//
//  ViewController.swift
//  HackathonTracker
//
//  Created by Emily Lam on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     @IBOutlet weak var tableView: UITableView!
    var poopItems: [PData] = []
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
//        cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
//        return cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayDataCell") as! displayDataCell
        
        switch indexPath.row {
        case 0:
            cell.amountLabel.text = "testing"
            
        default:
            cell.amountLabel.text = ""
            cell.dateCreatedLabel.text = ""
            cell.thicknessLabel.text = ""
        }
        return cell
    }
    
    
    
    @IBOutlet weak var addPoopData: UIBarButtonItem!
    
    @IBAction func addPoopData(_ sender: Any) {
        print("button pressed")
        count += 1
        self.tableView.reloadData()
        
    }
   

}

