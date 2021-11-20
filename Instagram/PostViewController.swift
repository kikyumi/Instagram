//
//  PostViewController.swift
//  Instagram
//
//  Created by 菊川 由美 on 2021/11/17.
//

import UIKit
import Firebase
import SVProgressHUD

class PostViewController: UIViewController {
    var image = UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    //投稿ボタン
    @IBAction func handlePostButton(_ sender: Any) {
        // 画像をJPEG形式に変換する
        let imageData = image.jpegData(CompressionQuality: 0.75)
        
        
    }
    //キャンセルボタン
    @IBAction func handleCancelButton(_ sender: Any) {
    }
    
    //最初の画面ロード時だけ呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 受け取った画像をImageViewに設定する
        imegeView.image = image
        
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
