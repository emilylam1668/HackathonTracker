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
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    
     @IBOutlet weak var tableView: UITableView!
    var poopItems: [PData] = []
    
    var count = 0
    
    let outsideMonthColor = UIColor(red:0.66, green:0.66, blue:0.66, alpha:1.0) //gray
    let monthColor = UIColor(red:0.78, green:0.59, blue:1.00, alpha:1.0) //purple
    let selectedMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor(red:1.00, green:0.73, blue:0.87, alpha:1.0) //pink
    
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        
        
        setupCalendarView()
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
   

    func setupCalendarView() {
            // setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
            
            // setup labels
        calendarView.visibleDates{ (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
            }
        var dates: [Date] = []
        let currentDate = Date()
        dates.append(currentDate)
        calendarView.selectDates(dates)
        calendarView.scrollToDate(currentDate)
            
        }
        
    func handleCelltextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
            
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColor
            } else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
        
        
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
        
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        
        let date = visibleDates.monthDates.first!.date
        
        formatter.dateFormat = "yyyy"
        year.text = formatter.string(from: date)
            
        formatter.dateFormat = "MMMM"
        month.text = formatter.string(from: date)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
}
    
extension ViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
            
            
            
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2018 12 31")!
            
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
            return parameters
        }
        
    }
    
extension ViewController: JTAppleCalendarViewDelegate {
        //display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        sharedFunctionToConfigureCell(cell: cell, cellState: cellState, date: date)
        return cell
        }
        
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CustomCell
        sharedFunctionToConfigureCell(cell: cell, cellState: cellState, date: date)
        }
        
    func sharedFunctionToConfigureCell(cell: CustomCell, cellState: CellState, date: Date) {
            cell.dateLabel.text = cellState.text
            
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        }
        
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        }
        
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
        }
        
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
        }
    }



