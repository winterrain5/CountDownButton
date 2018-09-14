### CountDownButton

#### 一个简单易用的倒计时按钮

##### How to use?

###### like this:

``` swift

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

```

##### that's all!


