//
//  FirstViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-12.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import JTAppleCalendar
import os.log

protocol CalendarDelegate: class {
    func dateSelected(_ date: Date)
    func currentVisibleMonth(_ date: Date)
}

class CalendarViewController: UIViewController {
    let formatter = DateFormatter()
    
    weak var delegate:CalendarDelegate?
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    let outsideMonthTextColor = UIColor(colorWithHexValue : 0xFFBDBDBD) //light gray
    let thisMonthTextColor = UIColor.darkGray
    let selectedDateColor = UIColor.red
    
    let todayNotSelectedTextColor = UIColor(colorWithHexValue : 0x00FF00)
    let todaySelectedTextColor = UIColor(colorWithHexValue : 0x1C8046) //dark green
    
    let today = Date()
    
    let currentCalendar = Calendar.current
    
    var generateOutDate: OutDateCellGeneration = .tillEndOfGrid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fourth view controller here")
        setupCalendarView()
        
        calendarView.scrollToDate(today)
        calendarView.selectDates([today])
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
        guard let validCell = view as? CustomCalendarCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view : JTAppleCell?, cellState : CellState, date : Date){
        guard let validCell = view as? CustomCalendarCell else { return }
        if cellState.isSelected {
            //Orig
            //validCell.dateLabel.textColor = selectedDateColor
            
            //option 2
            handleTodayCellTextColor(validCell: validCell, date: date, todayTextColor: UIColor.white, notTodayTextColor: thisMonthTextColor);
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                //Orig
                //validCell.dateLabel.textColor = thisMonthTextColor
                
                //option 2
                handleTodayCellTextColor(validCell: validCell, date: date, todayTextColor: todaySelectedTextColor, notTodayTextColor: thisMonthTextColor);
            } else {
                validCell.dateLabel.textColor = outsideMonthTextColor
            }
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo){
        //Setup month and year view of current visible date
        self.delegate?.currentVisibleMonth(visibleDates.monthDates.first!.date)
    }
    
    func handleTodayCellTextColor(validCell : CustomCalendarCell, date: Date, todayTextColor : UIColor, notTodayTextColor : UIColor) {
        validCell.dateLabel.textColor = (currentCalendar.isDateInToday(date)) ? todayTextColor : notTodayTextColor
    }
}


extension CalendarViewController : JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        print("fourth view controller here 2")
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        print("fourth view controller here 3")
        
        let startDate = DateUtil.getStartYear(date: today)
        let endDate = DateUtil.getEndYear(date: today)
        
        let parameters = ConfigurationParameters(startDate: startDate,
            endDate: endDate,
            numberOfRows: 6,
            calendar: currentCalendar,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .sunday,
            hasStrictBoundaries : true)
        
        return parameters
    }
}

extension CalendarViewController : JTAppleCalendarViewDataSource {
    //Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCalendarCell", for: indexPath) as! CustomCalendarCell
        cell.dateLabel.text = cellState.text
        
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
        self.delegate?.dateSelected(date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        //When scrolling calendar, change label
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



