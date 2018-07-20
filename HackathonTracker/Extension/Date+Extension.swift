//
//  Date+Extension.swift
//  HackathonTracker
//
//  Created by Justina Chen on 7/20/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation

extension Date
{
    func toString( ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
}
