//
//  DetailPoopViewController.swift
//  HackathonTracker
//
//  Created by Justina Chen on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class DetailPoopViewController: UIViewController {
    
    var poopItem = Pdata(thickness: 1.0, dateCreated: Date(), amount: 1)

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
    
    @IBAction func saveButton(_ sender: Any) {
        // add save code
            self.navigationController?.popViewController(animated: true)
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
    @IBOutlet weak var consistencyLabel: UILabel!
    @IBOutlet weak var consistencySlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
    }
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountSegmentedControl: UIStackView!
    @IBAction func amountChanged(_ sender: UISegmentedControl) {
    }
}
