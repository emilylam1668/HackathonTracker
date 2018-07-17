//
//  DetailPoopViewController.swift
//  HackathonTracker
//
//  Created by Justina Chen on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class DetailPoopViewController: UIViewController {
    
    var poopItem = PData(thickness: 1.0, dateCreated: Date(), amount: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
