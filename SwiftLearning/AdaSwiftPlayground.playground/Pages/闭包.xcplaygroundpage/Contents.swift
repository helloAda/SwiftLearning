

// 闭包

/*
 闭包是自包含的函数代码块，可以在代码中被传递使用。Swift中的闭包与C和Objcetive-C中的代码块(Block)以及其他语言中的匿名函数比较相似。
 
 函数也是闭包的一种
 1.全局函数是一个有名字但不会捕获任何值的闭包
 2.嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 
 
 Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
 1. 利用上下文推断参数和返回值类型
 2. 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
 3. 参数名称缩写
 4. 尾随闭包语法
 */


//闭包表达式 下面用几次迭代描述的相同功能

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//用函数
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)


//闭包语法表达式

//{ (parameters) -> return type in
//    statements
//}

//backward函数对应的闭包形式
reversedNames = names.sorted { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

//因为这个函数体很短  也可以改成一行代码
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

//根据上下文推断类型
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

//单表达式闭包隐式返回  //单行表达式可以参略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//参数名称缩写

/*
 Swift自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数
 如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略
  */

reversedNames = names.sorted(by: { $0 > $1 })

//运算符方法

/*
 Swift 的String类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。
 */
reversedNames = names.sorted(by: > )




//尾随闭包


//这是函数
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //函数部分
}

//这个是 不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    //闭包主体部分
})

//这个是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    //闭包主体部分
}

//上一部分可以改写为
reversedNames = names.sorted() { $0 > $1 }

//如果尾随闭包是函数或方法的唯一参数，使用尾随闭包的时候可以参略()
reversedNames = names.sorted { $0 > $1 }


/*
 Swift的Array类型有一个 map(_:) 方法，这个方法获取一个闭包表达式作为其唯一参数。该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方式和返回值类型由闭包来指定
 */

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


//值捕获

//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

