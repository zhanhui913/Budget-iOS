//
//  AccountViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-02.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit
import GTProgressBar

class AccountViewController: UIViewController {

    @IBOutlet weak var progressBar: GTProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.barMaxHeightInt = 20
        progressBar.progress = 0
        progressBar.barBorderColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.35, green:0.8, blue:0.36, alpha:1.0)
        progressBar.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
        progressBar.barBorderWidth = 0
        progressBar.barFillInset = 0
        progressBar.displayLabel = false
        //progressBar.labelTextColor = UIColor(red:0.35, green:0.88, blue:0.36, alpha:1.0)
        //progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left:5, bottom:0, right:5)
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
    
    @IBAction func increase(_ sender: UIButton){
        progressBar.progress += 0.1
    }

    
    @IBAction func decrease(_ sender: UIButton){
        progressBar.progress -= 0.1
    }
}
