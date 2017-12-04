//
//  TransactionItemViewCellTableViewCell.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-12-03.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import UIKit

class TransactionItemViewCell: UITableViewCell {

    
    @IBOutlet weak var icon : UIView!
    @IBOutlet weak var transactionName : UILabel!
    @IBOutlet weak var transactionCost : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        icon.layer.cornerRadius = 22
    }
/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
