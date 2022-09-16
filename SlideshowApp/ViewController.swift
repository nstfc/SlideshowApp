//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Natsuko Sakai on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let images = ["img01.jpg", "img02.jpg", "img03.jpg"]
    var i = 0
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "img01.jpg")
    }
    
    // 戻るボタンを押したときの処理
    @IBAction func slideBack(_ sender: Any) {
        if i == 0 {
            i = 2
        } else {
            i -= 1
        }
        let name = images[i]
        imageView.image = UIImage(named: name)
    }
    
    // 進むボタンを押したときの処理
    @IBAction func slideNext(_ sender: Any) {
        if i == 2 {
            i = 0
        } else {
            i += 1
        }
        let name = images[i]
        imageView.image = UIImage(named: name)
    }

    // 再生/停止ボタンを押したときの処理
    @IBAction func slideStartStop(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoChangeImage), userInfo: nil, repeats: true)
            startStopButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            nextButton.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }

    @objc func autoChangeImage() {
        i += 1
        if (i == images.count) {
            i = 0
        }
        let name = images[i]
        imageView.image = UIImage(named: name)
    }
    
    // 画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onTapImage" {
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
            resultViewController.image = imageView.image!
            
            // 戻るボタンタップ時に同じ画像を表示
            if timer != nil {
                timer.invalidate()
                timer = nil
                startStopButton.setTitle("再生", for: .normal)
                backButton.isEnabled = true
                nextButton.isEnabled = true
            }
        }
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "onTapImage", sender: nil)

    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}
