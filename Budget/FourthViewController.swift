//
//  FirstViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-12.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import JTAppleCalendar
import os.log

class FourthViewController: UIViewController {
    let formatter = DateFormatter()
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLabel : UILabel!
    @IBOutlet weak var monthLabel : UILabel!
    
    let outsideMonthTextColor = UIColor(colorWithHexValue : 0xFFBDBDBD)
    let thisMonthTextColor = UIColor(colorWithHexValue : 0xFF616161)
    let selectedMonthColor = UIColor(colorWithHexValue : 0xdf642f)
    //let currentDateSelectedViewColor = UIColor(colorWithHexValue : 0x4E3F5B)
    
    
    let todayDateTextColor = UIColor.blue
    
    let today = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("fourth view controller here", log: OSLog.default, type: .info)
        setupCalendarView()
        
        
        print("todays date is ----->")
        print(today)
        print("year is ")
        print("month is ");
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCalendarView(){
        //Setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        //Setup labels
        calendarView.visibleDates { visibleDates in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func handleCellTextSelected(view : JTAppleCell?, cellState : CellState){
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view : JTAppleCell?, cellState : CellState){
        guard let validCell = view as? CustomCell else { return }
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = thisMonthTextColor
            } else {
                validCell.dateLabel.textColor = outsideMonthTextColor
            }
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo){

        
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }
}


extension FourthViewController : JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        os_log("fourth view controller here 2", log: OSLog.default, type: .info)
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        /*
        let startDate = formatter.date(from: "2017 11 01")! // You can use date generated from a formatter
        let endDate = Date()                                // You can also use dates created from this function
        let calendar = Calendar.current                     // Make sure you set this up to your time zone. We'll just use default here
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: calendar,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
                                                 firstDayOfWeek: .sunday)*/
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        os_log("fourth view controller here 3", log: OSLog.default, type: .info)
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        let calendar = Calendar.current
        //let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        
        let parameters = ConfigurationParameters(startDate: startDate,
            endDate: endDate,
            numberOfRows: 6,
            calendar: calendar,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday,
            hasStrictBoundaries : true)
        
        
        return parameters
    }
    
 
    
}


extension FourthViewController : JTAppleCalendarViewDataSource {
    //Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
}






extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}



