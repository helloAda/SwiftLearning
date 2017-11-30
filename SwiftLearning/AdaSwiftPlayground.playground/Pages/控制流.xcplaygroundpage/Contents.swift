

import Foundation

// ----if
//条件不需要()  语句必须有{}
let x = 10
if x > 5 {
    print("大")
}else{
    print("小")
}

// ----三目

var y = 10
y > 5 ? print("大") : print("小")
y = 3
//如果不处理任何 直接 () 表示空执行
y > 5 ? print("大") : ()


// ----可选项的判断

let xx: Int? = 20
let yy: Int? = 30

//强行解包有风险
//1 使用if判断 缺点：多层嵌套或逻辑复杂后代码不易阅读

if xx != nil && yy != nil {
    print(xx! + yy!)
}else{
    print("x 或者 y 为nil")
}


//2 使用 '??' 
//  简单的三目运算  如果有值 使用值 如果没有值 使用 ?? 后面的值替代

print((xx ?? 0) + (yy ?? 0))

// ?? 操作符的优先级 低
print(xx ?? "" + "优先级")


// 3 if let ／ var 判断 连用 判断对象的值 是否为nil 
if let dxx = xx, let dyy = yy {
    //进入分支之后 dxx dyy 一定有值，不用解包 作用域仅在{}内
    print(dxx + dyy)
}


//4 guard 代码多的时候适用
func demo(){
    
    guard let dxx = xx, let dyy = yy else {
        print("xx或yy为nil")
        return
    }
    //代码执行到这里，dxx dyy一定有值 不需要考虑解包
    //优点 降低分支层次   swift2.0推出
    print(dxx + dyy)
}

// if let  --- guard 命名技巧
// 使用同名的变量名，后续使用的都是非空值 不用纠结命名
func demo1(){
    guard let xx = xx ,let yy = yy else{return}
    print(xx + yy)
}



//--------- switch------------

/*
    1、可以对任意类型的值进行分支，不在局限于整数
    2、一般不需要break 不会穿透
    3、如果需要多值用 ‘,’隔开
    4、所有的分支都需要一条指令(什么都不做加break)
    5、 switch还可以加 where
*/
func demo2(name: String){
    
    switch name {
    case "小明":
        print("小红")
    case "小君":
        break
    case "李雷","韩梅梅":
        print("芳芳")
    case name where name.characters.count == 3:
        print("长度为3")
    default:
        print("单身")
    }
}

demo2(name: "小明")
demo2(name: "李雷")
demo2(name: "小君")
demo2(name: "三个字")





