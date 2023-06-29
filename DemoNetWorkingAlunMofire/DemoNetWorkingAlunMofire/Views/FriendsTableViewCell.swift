//
//  FriendsTableViewCell.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvt: UIImageView!
    
    @IBOutlet weak var lblID: UILabel!
    
    @IBOutlet weak var lblfullName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
