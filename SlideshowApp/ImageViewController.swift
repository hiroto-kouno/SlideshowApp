//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 河野 裕門 on 2022/04/14.
//

import UIKit

class ImageViewController: UIViewController {

    var picture : UIImage? = UIImage(named:"")
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //遷移元から受け取った画像をimageViewに表示
        imageView.image = picture
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
