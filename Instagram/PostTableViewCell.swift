//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 菊川 由美 on 2021/11/20.
//

import UIKit
import FirebaseStorageUI

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
   
    
    @IBOutlet weak var commentButton: UIButton!  //新規追加
    @IBOutlet weak var commentLabel: UILabel!  //新規追加
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // PostDataの内容をセルに表示
    func setPostData(postData: PostData){
        // 画像の表示
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)
        // キャプションの表示
        if postData.caption != nil{
            captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        }else{
            print("DEBUG_PRINT: nameかcaptionがnilです")
        }
        
        // 日時の表示
        dateLabel.text = ""
        if let date = postData.date{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            dateLabel.text = dateString
        }
        // いいね数の表示
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        // いいねボタンの表示
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            likeButton.setImage(buttonImage, for: .normal)
        } else{
            let buttonImage = UIImage(named: "like_none")
            likeButton.setImage(buttonImage, for: .normal)
        }
        
        //■■■■■■コメントの表示■■■■■■
        if postData.commentText != nil {
            commentLabel.text = "\(postData.name!) : \(postData.commentText)"
            commentLabel.textColor = .gray
        }else{
            commentLabel.text = "コメントはありません"
            commentLabel.textColor = .gray
        }
    }
}
