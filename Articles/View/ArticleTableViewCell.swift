//
//  ArticleTableViewCell.swift
//  News
//
//  Created by Ravi kumar on 14/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import UIKit
import SDWebImage
class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var designationLabel: UILabel!
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var commentsCountLabel: UILabel!
    
    func configureCell(_ articleViewModel:ArticleViewModel)  {
        nameLable.text = articleViewModel.userName
        timeAgoLabel.text = articleViewModel.timeAgo
        likesCountLabel.text = articleViewModel.likeCount
        commentsCountLabel.text = articleViewModel.commentsCount
        designationLabel.text = articleViewModel.userDesination
        postDescriptionLabel.text = articleViewModel.postContent
        
        if let postImage = articleViewModel.postImageURL{
            self.postImageView.superview?.isHidden = false
            postImageView.sd_setImage(with: postImage, placeholderImage: UIImage(named: "post_placeholder"), options: SDWebImageOptions.progressiveLoad, context: nil)
        }
        else{
            self.postImageView.superview?.isHidden = true
        }
      
        self.profileImageView.sd_setImage(with: articleViewModel.userAvtarURL, placeholderImage: UIImage(named: "profile_placeholder"), options: SDWebImageOptions.progressiveLoad, context: nil)
    }
  
}
