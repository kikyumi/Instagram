//
//  CommentViewController.swift
//  Instagram
//
//  Created by 菊川 由美 on 2021/11/23.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    @IBOutlet weak var commentTextView: UITextView!

    
    //コメントデータの追加　※postDataRecievedは、前の画面から受け取る値（Firebaseでの保管場所）
    var postDataRecieved : PostData?

    //コメント投稿ボタン
    @IBAction func commentPostButton(_ sender: Any) {
        // FireStoreに投稿データを保存する
        //コメントを格納するFirebaseの保管場所を定義
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postDataRecieved!.id)

        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        //コメント投稿
        //もしcommentTextが存在しなければ、新しくセット
        if postDataRecieved?.commentText == nil{
            postRef.updateData(["commentText": commentTextView.text!])
        }else{
            //もし既にcommentTextが存在すれば、arryUnionで配列に追加
            postRef.updateData(["commentText": FieldValue.arrayUnion([commentTextView.text!])])
        }

        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました！")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //キャンセルボタン
    @IBAction func commentCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
