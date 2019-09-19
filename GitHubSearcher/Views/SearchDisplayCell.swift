//
//  SearchDisplayCell.swift
//  GitHubSearcher
//
//  Created by Ayushi Parashar on 9/18/19.
//  Copyright © 2019 Ayushi Parashar. All rights reserved.
//

import UIKit

class SearchDisplayCell: UITableViewCell {
    @IBOutlet weak var avatarImageIcon: UIImageView! = nil
    @IBOutlet weak var userNameLabel: UILabel! = nil
    @IBOutlet weak var numberOfRepositoryLabel: UILabel! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
