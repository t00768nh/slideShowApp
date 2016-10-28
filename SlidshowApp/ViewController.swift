//
//  ViewController.swift
//  SlidshowApp
//
//  Created by t on 2016/10/26.
//  Copyright © 2016年 hattori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    //必要な変数を宣言
    var photos:Array = ["8.jpg", "9.jpg", "11.jpg"] //写真の用意
    var firstphoto:String?  //写真の最初の要素
    var lastphoto:String?  //写真の最後の要素
    
    var timer: Timer? //タイマー
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //１枚目の画像を表示
        imageView.image = UIImage(named: photos[0])

    }
    
    //画像を一個進めて描写する関数
    func replacephoto(){
        //配列の最初の値を取得
        firstphoto =  photos.first!
        //配列の最初の値を削除
        photos.removeFirst()
        //配列の最後に追加
        photos.append(firstphoto!)
        //画像の再描写
        imageView.image = UIImage(named: photos[0])
    }
    
    //画像を一個戻して描写する関数
    func replacephotoBack(){
        //配列の最初の値を取得
        lastphoto =  photos.last!
        //配列の最初の値を削除
        photos.removeLast()
        //配列の最後に追加
        photos.insert(lastphoto!, at: 0)
        //画像の再描写
        imageView.image = UIImage(named: photos[0])
        
    
    }
    
    
    
    //タイマーで呼び出されるメソッド
    func onUpdate(_ timer : Timer){
      replacephoto()
    }
    
    
    
    //スライドショーのボタン
    @IBAction func slider(_ sender: AnyObject) {
        if timer?.isValid == true {
        timer?.invalidate()
            //ラベル変更
            sender.setTitle("start", for: UIControlState.normal)
            
            //ボタン無効化
            backBtn.enabled = false
            nextBtn.enabled = false
    
        }
        else{
            //タイマーを作成
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.onUpdate(_:)), userInfo: nil, repeats: true)
            //ラベル変更
            sender.setTitle("stop", for: UIControlState.normal)
            
            //ボタンを有効化
            backBtn.isEnabled = true
            nextBtn.isEnabled = true
        }
    }
    
    
    //進むボタン
    @IBAction func next(_ sender: AnyObject) {
         replacephoto()
    }
    
    //戻るボタン
    @IBAction func back(_ sender: AnyObject) {
        replacephotoBack()
    }
    
    
    
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        //sequeから遷移先のresultviewcontrollerを取得する
        let resultViewController:resultViewController = seque.destination as!resultViewController
        
        
        resultViewController.imageWide =  photos[0]
        
  
    }
    
    
    
    @IBAction func unwind(seque: UIStoryboardSegue){
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

