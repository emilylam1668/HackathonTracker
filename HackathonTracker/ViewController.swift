//
//  ViewController.swift
//  HackathonTracker
//
//  Created by Emily Lam on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import CoreData
import JTAppleCalendar


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var tableView: UITableView!
    var poopItems: [PData] = []
    
    //var count = 0
    
    let outsideMonthColor = UIColor(red:0.66, green:0.66, blue:0.66, alpha:1.0) //gray
    let monthColor = UIColor(red:0.78, green:0.59, blue:1.00, alpha:1.0) //purple
    let selectedMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor(red:1.00, green:0.73, blue:0.87, alpha:1.0) //pink
    
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        poopItems = CoreDataHelper.retrieve()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poopItems.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
//        cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
//        return cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayDataCell") as! displayDataCell
        
        
        cell.amountLabel.text = poopItems[indexPath.row].amount
        // cell.dateCreatedLabel.text = String(poopItems[indexPath.row].dateCreated!)
        cell.thicknessLabel.text = String(poopItems[indexPath.row].thickness)
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            poopItems.remove(at: indexPath.row)
        }
    }
    
    
    
    @IBOutlet weak var addPoopData: UIBarButtonItem!
    
    @IBAction func addPoopData(_ sender: Any) {
       
//        let storyBoard = UIStoryboard(name: "DetailedPoop", bundle: nil)
//        let detailViewController = storyBoard.instantiateInitialViewController() as! DetailPoopViewController
//        self.navigationController!.pushViewController(detailViewController, animated: true)
        
       // self.tableView.reloadData()
        
    }
   

    }



