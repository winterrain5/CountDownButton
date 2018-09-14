//
//  CountDownButton.swift
//
//  Created by Derrick on 2018/9/13.
//  Copyright © 2018年 bike. All rights reserved.
//

import UIKit
import Foundation

class CountDownButton: UIButton {
    
    
    var countDownFinished: ((_ sender:CountDownButton,_ second: Int) -> String)?
    
    var countDownChange: ((_ sender:CountDownButton,_ second: Int) -> String)?
    
    var touchedCountDown: ((_ sender:CountDownButton,_ second: Int) -> ())?
    
    private var totalSecond = 0
    private var timer: Timer?
    private var startDate:Date?
    
    // MARK: touch action
    // 倒计时按钮点击回调
    public func countDownButtonHandler(_ handler:@escaping (_ sender:CountDownButton,_ second: Int) -> ()) {
        touchedCountDown = handler
        self.addTarget(self, action: #selector(touched(sender:)), for: .touchUpInside)
    }
    
    @objc private func touched(sender: CountDownButton) {
        if touchedCountDown != nil {
            touchedCountDown!(sender, Int(sender.tag))
        }
    }
    
    // MARK: count down method
    public func startCountDownWithSecond(_ totalSecond: Int) {
        self.totalSecond = totalSecond
        self.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerStart(timer:)), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .commonModes)
    }
    
    @objc private func timerStart(timer: Timer) {
        
        totalSecond -= 1
        if totalSecond < 0 {
            
            stopCountDown()
            
        }else {
            if countDownChange != nil {
                self.setTitle(countDownChange!(self,totalSecond), for: .normal)
                self.setTitle(countDownChange!(self,totalSecond), for: .disabled)
            }else{
                let title = "\(totalSecond)"
                self.setTitle(title, for: .normal)
                self.setTitle(title, for: .disabled)
            }
        }
    }
    
    // 停止倒计时
    public func stopCountDown() {
        if timer != nil {
            if (timer?.isValid)! {
                timer?.invalidate()
                self.isEnabled = true
                if countDownFinished != nil {
                    self.setTitle(countDownFinished!(self,totalSecond), for: .normal)
                    self.setTitle(countDownFinished!(self,totalSecond), for: .disabled)
                }else{
                    self.setTitle("重新获取", for: .normal)
                    self.setTitle("重新获取", for: .disabled)
                }
            }

        }
    }
    
    // 倒计时时间改变回调
    public func countDownChange(_ handler:@escaping (_ sender:CountDownButton,_ second: Int) -> String) {
        countDownChange = handler
        
    }
    
    //倒计时结束回调
    public func countDownFinished(_ handler:@escaping (_ sender:CountDownButton,_ second: Int) -> String) {
        countDownFinished = handler
        
    }
 
    
    
}
