

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

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()



//闭包是引用类型

/*
 上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型
 
 无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用
 这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包
 */

let alsoIncrementByten = incrementByTen
alsoIncrementByten()


//逃逸闭包

/*
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
 */

var completionHandlers:[() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//在逃逸闭包中必须显示的引用self
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)



//自动闭包

/*
 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包
 */

/*
 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。下面的代码展示了闭包如何延时求值
  */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)


//将闭包作为参数传递给函数时，你能获得同样的延时求值行为。

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: {customersInLine.remove(at: 0)})


func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))


//自动闭包可以逃逸

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}


