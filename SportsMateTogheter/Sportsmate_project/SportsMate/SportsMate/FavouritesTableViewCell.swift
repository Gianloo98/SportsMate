//
//  FavouritesTableViewCell.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 16/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favouritesImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
