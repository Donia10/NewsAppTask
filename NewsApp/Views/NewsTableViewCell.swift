//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Donia Ashraf on 26/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var sourceNameLbl: UILabel!
    @IBOutlet private weak var sourceBtn: UIButton!
    @IBOutlet private weak var titleLbl: UILabel!
    var article :Article? {
        didSet{
            titleLbl.text = article?.newsTitle
            sourceNameLbl.text = article?.newsSource.name
            newsImageView.sd_setImage(with:URL(string: article?.newsImage ?? ""), placeholderImage: UIImage(named: "noimg"))
           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         cellView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
