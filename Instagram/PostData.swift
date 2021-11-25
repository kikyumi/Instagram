//
//  PostData.swift
//  Instagram
//
//  Created by 菊川 由美 on 2021/11/20.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var commentText: String?  //新規追加
    
    init(document: QueryDocumentSnapshot){
        id = document.documentID   //documentIDプロパティは、個別に生成された投稿IDのこと
        
        let postDic = document.data()    //data()メソッドで「辞書形式」のデータを取り出せる
        name = postDic["name"] as? String
        caption = postDic["caption"] as? String
        commentText = postDic["commentText"] as? String  //新規追加
        
        let timestamp = postDic["date"] as? Timestamp
        date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // firstIndex(of: ◯◯)で、配列の中に◯◯が含まれているかチェックできる
            if likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識
                isLiked = true
            }
        }
    }
    
}
