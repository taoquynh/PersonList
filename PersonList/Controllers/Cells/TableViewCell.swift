//
//  TableViewCell.swift
//  PersonList
//
//  Created by Taof on 5/22/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var person: Person? {
        didSet {
            if let data = person {
                avatarImageView.image = data.avatarImage
                nameLabel.text = data.name
                phoneLabel.text = data.phone
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height/2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.backgroundColor = .blue
        avatarImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
