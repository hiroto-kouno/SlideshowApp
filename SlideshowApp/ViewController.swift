//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 河野 裕門 on 2022/04/14.
//

import UIKit

class ViewController: UIViewController {

    var number = 0
    
    var timer: Timer!
    
    @IBOutlet weak var nextButton: UIButton! //進むボタン
    @IBOutlet weak var backButton: UIButton! //戻るボタン
    @IBOutlet weak var slideButton: UIButton! //再生・停止ボタン
    @IBOutlet weak var imageView: UIImageView!
    
     @IBAction func unwind(_ segue: UIStoryboardSegue){
         
     }
     
    let birds : [UIImage] = [UIImage(named: "BirdPicture/bird1.jpeg")!,UIImage(named: "BirdPicture/bird2.jpeg")!,UIImage(named: "BirdPicture/bird3.jpeg")!,UIImage(named: "BirdPicture/bird4.jpeg")!,UIImage(named: "BirdPicture/bird5.jpeg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        //ImageViewに最初の画像を表示
        imageView.image = birds[number]
    }
    
     //進むボタンを押したとき
    @IBAction func nextSlide(_ sender: Any) {
        
        slideShow() //スライドを進める
    }
    
     //戻るボタンを押したとき
    @IBAction func backSlide(_ sender: Any) {
         //最初の画像だった場合、最後の画像へ戻る
        if(number == 0) {
            number = birds.count
        }
        //一つ前の画像に戻る
        number -= 1
        imageView.image = birds[number]
    }
     
    //再生・停止ボタンを押したとき
    @IBAction func showSlide(_ sender: Any) {
        //self.timerがnilだった場合
        if(self.timer == nil) {
            slideButton.setTitle("停止", for: .normal) //ボタンのテキストを変更
            nextButton.isEnabled = false //次へ・戻るボタンを無効化する
            backButton.isEnabled = false

            //タイマーを生成する
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)),userInfo: nil, repeats: true)
        }
        else{
            slideStop() //スライドショーを停止
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        slideShow() //スライドを進める
    }
    
    //スライドをすすめるときの処理
    func slideShow() {
        //一つ先の画像へ進む
        number += 1
        //最後の画像だった場合、最初の画像へ戻る
        if(number == birds.count) {
            number = 0
        }
        imageView.image = birds[number]
    }
    
    //スライドを止めるときの処理
    func slideStop() {
        slideButton.setTitle("再生", for: .normal) //ボタンのテキストを変更
        nextButton.isEnabled = true //次へ・戻るボタンを有効化する
        backButton.isEnabled = true
        self.timer.invalidate() //タイマーを停止する
        self.timer = nil //self.timerにnilを代入
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //タイマーが生成されている場合
         if(self.timer != nil){
             slideStop() //スライドショーを停止
        }
        let imageViewController : ImageViewController = segue.destination as! ImageViewController
        //タップした画像を遷移先に渡す
        imageViewController.picture = birds[number]
    }
}

