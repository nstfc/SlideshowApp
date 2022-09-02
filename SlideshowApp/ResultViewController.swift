//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Natsuko Sakai on 2022/09/01.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView02: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 遷移元から取得したimageをimageView02のimageに渡す
        imageView02.image = image
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
