//
//  CalendarViewController.swift
//  HackathonTracker
//
//  Created by Ruhsane Sawut on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    let outsideMonthColor = UIColor(red:0.66, green:0.66, blue:0.66, alpha:1.0) //gray
    let monthColor = UIColor(red:0.78, green:0.59, blue:1.00, alpha:1.0) //purple
    let selectedMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor(red:1.00, green:0.73, blue:0.87, alpha:1.0) //pink
    
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupCalendarView()
    }
    @IBAction func segmentChoice(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0: callPoopViewController()
        default: break
            
        }
    }

    @IBAction func addNewPoopData(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addPoopDetails", sender: self)
    }

    func callPoopViewController(){
//        let storyboard = UIStoryboard(name: "DetailedPoop", bundle: nil)
//        let detail = storyboard.instantiateInitialViewController() as! DetailPoopViewController
//        self.present(detail, animated: true, completion: nil)
        self.performSegue(withIdentifier: "addPoopDetails", sender: self)
    }
    
    func loadTableview(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateInitialViewController() as! ViewController
        self.addChildViewController(mainViewController)
        mainViewController.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        self.containerView.addSubview(mainViewController.view)
        mainViewController.didMove(toParentViewController: self)
        mainViewController.tableView.reloadData()
        
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
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        loadTableview()
    }
}

extension CalendarViewController: JTAppleCalendarViewDataSource {
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

extension CalendarViewController: JTAppleCalendarViewDelegate {
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
        print("selected")
        loadTableview()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCelltextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
}

extension CalendarViewController {
    
}
