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
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postDataRecieved!.id).collection("commentCollection").document()
        let name = Auth.auth().currentUser?.displayName
        let commentDic = [
            "name": name!,
            "commentText": commentTextView.text!,
            "date": FieldValue.serverTimestamp(),
        ] as [String: Any]
 
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        //コメント投稿
        postRef.setData(commentDic)
        
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
    override func viewWillAppear(_ animated: Bool) {
        
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
