//
//  XIBTableViewCell.swift
//  p4
//
//  Created by Shuai Zheng on 4/24/20.
//  Copyright © 2020 Shuai Zheng. All rights reserved.
//

import UIKit

class XIBTableViewCell: UITableViewCell,Shakeable {
    
    
    @IBOutlet weak var gg: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gg.text="ddd"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func createCell() -> XIBTableViewCell? {
          let nib = UINib(nibName: "XIBTableViewCell", bundle: nil)
          let cell = nib.instantiate(withOwner: self, options: nil).last as? XIBTableViewCell
          return cell
      }
    
}
