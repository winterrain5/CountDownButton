//
//  ViewController.swift
//  CountDownButton
//
//  Created by Derrick on 2018/9/14.
//  Copyright © 2018年 bike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetchCodeAction(_ sender: CountDownButton) {
        
        // xib中需要将button类型设置为custom 否则会跳动
        
        // 开始倒计时 按钮自动禁用
        sender.startCountDownWithSecond(60)
        
        // 倒计时进行中 可以设置按钮上的文字
        sender.countDownChange { (btn, second) -> String in
            "\(second)"
        }
        
        // 倒计时结束后重新设置按钮上的文字并解除禁用状态
        sender.countDownFinished { (btn, second) -> String in
            "获取"
        }
    }
    
}

