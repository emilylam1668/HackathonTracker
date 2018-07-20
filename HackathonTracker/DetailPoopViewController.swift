//
//  DetailPoopViewController.swift
//  HackathonTracker
//
//  Created by Justina Chen on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class DetailPoopViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let identifier = segue.identifier else { return }
//        switch identifier {
//        case "save":
//
//
//        default:
//
//        }
//    }
    @IBOutlet weak var consistencyLabel: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            
        case "Save":
            let pData = CoreDataHelper.newPData()
            let selectedIndex = amountSegmentControl.selectedSegmentIndex
            if selectedIndex == 0 {
                pData.amount = "Few"
            } else if selectedIndex == 1 {
                pData.amount = "Moderate"
            } else if selectedIndex == 2 {
                pData.amount = "Plenty"
            }
            pData.thickness = consistencySlider.value
            pData.dateCreated = Date()
            CoreDataHelper.save()
        case "Cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var amountSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var consistencySlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
    }
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBAction func amountChanged(_ sender: UISegmentedControl) {
    }
}
