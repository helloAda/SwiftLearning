

import Foundation

//-----函数-----

//定义： 函数名(形参列表) -> 返回值类型
func sum (x: Int, y: Int) -> Int {
    return x + y
}

/*  调用
    Swift 1.0  sum(10,50) 所有的形参会省略
    Swift 2.0  sum(10,y: 50) 第一个形参会省略
    Swift 3.0  sum(x: 10, y: 50)
 */

print(sum(x: 10, y: 10))

/*
    外部参数
    外部参数就是在行参前面加一个名字 不会影响函数的内部 让外部看起来更直观
    外部参数如果使用 ‘_’ 在调用时 会忽略行参名字
    在Swift中 '_' 可以忽略任何不在意的内容
 */

func sum1 (num1 x: Int, _ y: Int) -> Int{
    return x + y
}

print(sum1(num1: 10, 10))

/*
    默认值
    通过给参数设置默认值 调用时可以任意组合参数
*/

func sum3 (x: Int = 4, y: Int = 4) -> Int {
    return x + y;
}
print(sum3())
print(sum3(x: 10, y: 10))
print(sum3(x: 10))


/*
    无返回值函数 主要用在闭包
 */

func demo1() {
    print("无返回值1")
}
func demo2() -> () {
    print("无返回值2")
}
func demo3() -> Void {
    print("无返回值3")
}
