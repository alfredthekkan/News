//
//  ArticleTableViewCell.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/24/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mediaImageView.layer.cornerRadius = 24
        // Initialization code
    }
    
    func setup(article: Article) {
        
        titleLabel.text = article.title
        authorLabel.text = article.byLine
        dateLabel.text = article.publishedDate?.description ?? ""
        if let url = article.thumnail {
            Alamofire.request(url).responseImage { [weak self] (response) in
                self?.mediaImageView.image = response.result.value
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
