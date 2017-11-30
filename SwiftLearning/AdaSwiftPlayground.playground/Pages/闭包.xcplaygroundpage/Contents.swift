

import Foundation

// 闭包类似于 OC的block 但是应用更广
// OC中block是匿名的函数 Swift中函数是特殊的闭包


/*
 OC中的block：
 1 预先定义好的代码
 2 在需要的时候执行
 3 可以当作参数传递
 4 可以有返回值
 5 要注意循环引用
 */

/*
 闭包：
 1 预先准备好的代码
 2 在需要的时候执行
 3 可以当作参数传递
 */


//闭包中 参数 返回值都是写在{}中 需要关键字 in 分隔定义和实现
// { 行参列表 -> 返回值类型 in 实现代码 }


//简单闭包 () -> () 没有参数、返回值 可以连 in 都省略
let f = {
    print("简单闭包")
}
f()

// 带参数的闭包

let f1 = { (x: Int) -> () in
    print(x)
}
f1(3)

let f2 = { (x: Int) -> Int in
    return x + 1
}
f2(3)

/*
    闭包的应用场景
    1 异步执行完成回调
    2 控制器间回调
    3 自定义视图回调
 */

//这里用GCD演示 回调
//GCD(Grand Central Dispatch) 队列调度任务(闭包\block),以同步\异步的方式执行
//这段代码这里看不到效果 新建一个项目 拷贝过去
func showGCD (completion: @escaping (_ result: [String])-> ()) -> () {
    DispatchQueue.global().async {
        print("异步 耗时的操作\(Thread.current)")
        Thread.sleep(forTimeInterval: 1.0)
        let data = ["威少再砍三双，雷霆连胜"]
        
        DispatchQueue.main.async(execute: {
            print("回到主线程更新ui \(Thread.current)")
            completion(data)
        })
    }
}

//这个也是尾随闭包
showGCD { (result) in
    print(result)
}


//----------尾随闭包
//如果函数的最后一个参数是闭包，函数参数可以提前结束，最后一个参数直接使用{}包装闭包的代码

//普通的闭包书写
showGCD(completion: { (result: [String]) -> () in
    print(result)
})
//尾随闭包书写
showGCD { (result) in
    print(result)
}

//这个也是尾随闭包
DispatchQueue.global().async {
    //嵌套Xcode不会改成尾随闭包
    DispatchQueue.main.async(execute: {
    })
}



//          ----解除循环引用-----

//   循环引用: 闭包对self 进行了引用 self 对闭包也进行了引用
//   新建一个项目在ViewController里运行下面代码

var completionCallBack: (() -> ())?

func cycle(completion: @escaping () -> ()) -> () {
//    使用属性记录闭包  self 对闭包进行了引用
    completionCallBack = completion
    
    DispatchQueue.global().async {
        print("耗时操作")
        Thread.sleep(forTimeInterval: 2)
        DispatchQueue.main.async {
            //回调执行闭包
            completion()
        }
    }
}
//
////解除循环引用，需要打断引用链条
////方法1: OC的方式
//weak var weakSelf = self //这里weak 可能会在运行时被修改 -> 指向的对象一旦被释放，会被置为nil 所以只能 修饰 var
//cycle {
//    // ?  可选解包 如果self已经被释放，不会向对象发送gettetr消息了
//    // !  强行解包 如果self已经被释放，强行解包会导致崩溃
//    // 所以这里用 ？可选解包
//    
////    注： weakSelf?.view只是单纯的发送消息，没有计算
////    强行解包，是因为需要计算，可选项不能参与计算 所以需要强行解包
//    print(weakSelf?.view)
//}
//

////Swift的方式 推荐[weak self]
////[weak self] 表示{}中所有的self都是弱引用，需要注意解包    (类似OC __weak)
//cycle { [weak self] in
//    print(self?.view)
//}
////[unowned self] 表示 {}中的所有self 都是assign的,不会强引用，但是，如果对象被释放，继续调用，就会出现野指针 (类似OC __unsafe_unretained)
//cycle { [unowned self] in
//    print(self.view)
//}

////类似oc的dealloc
//deinit {
//    print("释放内存")
//}

