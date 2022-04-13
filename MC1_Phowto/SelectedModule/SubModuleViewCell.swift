//
//  SubModuleViewCell.swift
//  Phowto
//
//  Created by Ricky on 09/04/22.
//



import UIKit

class SubModuleViewCell: UITableViewCell {
    
    
    @IBOutlet weak var subModuleName: UILabel!
 
    @IBOutlet weak var subModuleProgress: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
