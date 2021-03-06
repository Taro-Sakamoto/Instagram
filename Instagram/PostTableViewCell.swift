//
//  PostTableViewCell.swift
//  
//
//  Created by Taro Sakamoto on 9/30/16.
//
//

import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var comment: UITextField!
    
    @IBOutlet weak var commentbutton: UIButton!
    
    @IBOutlet weak var commentlabel: UILabel!
    

func setPostData(postData: PostData) {
    postImageView.image = postData.image
    captionLabel.text = "\(postData.name!) : \(postData.caption!)"
    commentlabel.text = postData.comment
    let likeNumber = postData.likes.count
    likeLabel.text = "\(likeNumber)"
    
    
    
    
    let formatter = NSDateFormatter()
    formatter.locale = NSLocale(localeIdentifier: "ja_JP")
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    
    let dateString:String = formatter.stringFromDate(postData.date!)
    dateLabel.text = dateString
   
    
    
    
    if postData.isLiked {
        let buttonImage = UIImage(named: "like_exist")
        likeButton.setImage(buttonImage, forState: UIControlState.Normal)
    
    
    
    
    }else {
        let buttonImage = UIImage(named: "like_none")
        likeButton.setImage(buttonImage, forState: UIControlState.Normal)
    }

    
    
    
   
    
    
    
    
    
    
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    // [onishi] コメントを返す
    func getComment() -> String {
        return self.comment.text!
        
    }
    
}
