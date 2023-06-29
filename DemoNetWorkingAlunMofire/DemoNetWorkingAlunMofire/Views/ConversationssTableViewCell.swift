//
//  ConversationssTableViewCell.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import UIKit

class ConversationssTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblIDConversation: UILabel!
    @IBOutlet weak var lblCreateAt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
