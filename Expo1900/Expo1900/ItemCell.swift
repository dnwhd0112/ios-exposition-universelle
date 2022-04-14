//
//  ItemCell.swift
//  Expo1900
//
//  Created by 곽우종 on 2022/04/14.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var cellDescription: UILabel!
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
