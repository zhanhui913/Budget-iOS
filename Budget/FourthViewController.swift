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
    
    let outsideMonthTextColor = UIColor(colorWithHexValue : 0xFFBDBDBD) //light gray
    let thisMonthTextColor = UIColor.darkGray
    let selectedDateColor = UIColor.red
    
    let todayNotSelectedTextColor = UIColor(colorWithHexValue : 0x00FF00)
    let todaySelectedTextColor = #colorLiteral(red: 0.004680971149, green: 0.4778389335, blue: 0.998493135, alpha: 1)
    
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
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view : JTAppleCell?, cellState : CellState, date : Date){
        guard let validCell = view as? CustomCell else { return }
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
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }
    
    func handleTodayCellTextColor(validCell : CustomCell, date: Date, todayTextColor : UIColor, notTodayTextColor : UIColor) {
        validCell.dateLabel.textColor = (currentCalendar.isDateInToday(date)) ? todayTextColor : notTodayTextColor
    }
}


extension FourthViewController : JTAppleCalendarViewDelegate {
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

extension FourthViewController : JTAppleCalendarViewDataSource {
    //Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextSelected(view : cell, cellState : cellState)
        handleCellTextColor(view : cell, cellState : cellState, date : date)
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



