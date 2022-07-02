//
//  taskFiveTableViewCell.swift
//  Homework 3
//
//  Created by Beavean on 28.06.2022.
//

import UIKit

class fakeInstaCell: UITableViewCell {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet weak var postComment: UILabel!
    @IBOutlet weak var otherComments: UILabel!
    @IBOutlet weak var timeSincePosted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
