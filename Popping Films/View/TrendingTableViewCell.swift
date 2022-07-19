//
//  TrendingTableViewCell.swift
//  Popping Films
//
//  Created by rsbj on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title:String, image:UIImage, dateLabel:String){
        titleLabel.text = title
        posterImage.image = image
        self.dateLabel.text = dateLabel
    }
}
