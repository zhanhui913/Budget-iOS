//
//  AddCategoryViewController.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-02.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClick(_ sender: UIBarButtonItem){
        //save something
        self.dismiss(animated: true, completion: nil)
    }
}
