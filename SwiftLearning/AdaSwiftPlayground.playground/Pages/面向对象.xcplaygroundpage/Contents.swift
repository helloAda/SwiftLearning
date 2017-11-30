

import Foundation


//          -----面向对象-----

/*
 初始化可能遇到的问题
 1、Class 'Person' has no initializers 类没有初始化构造器 可以有多个，默认是init
 2、 Overriding declaration requires an 'override' keyword
 父类有这个方法了,子类要重新实现,需要override关键字
 3、Property 'self.name' not initialized at implicitly generated super.init call
 在调用隐式生成的super.init构造函数之前，属性self.name没有被初始化
 4、Property 'self.name' not initialized at super.init call
 提示给self.name 初始化分配空间，设置初始值
 */

/*
 初始化的步骤
 1、给自己的属性分配空间并设置初始值
 2、调用父类的构造函数,给父类的属性分配空间设置初始值
 (NSObject没有属性,只有一个成员变量 'isa')
 3、如果重载了构造函数,并且没有实现父类init方法,系统不再提供init()构造函数(默认是有的)，因为默认的构造函数，不能给本类的属性分配空间
 */
class Person : NSObject{
    var name: String
    
    //重写,父类有这个方法
    override init() {
        name = "ada"
        super.init()
    }
    
    //重载,函数名相同，但是参数和个数不同
    init(name: String) {
        
        //使用参数的name 设置给属性
        self.name = name
        super.init()
    }
}


//    子类重载构造函数
class Student: Person{
    var num: String
    init(name: String, num: String) {
        self.num = num
        //调用父类方法给name初始化赋值
        super.init(name: name)
    }
}

/*
 '()'
 对应OC中的 alloc / init
 在Swift中对应一个函数 init()  叫构造函数
 作用：分配空间，初始化成员变量
 */

let p = Person()
print(p.name)
let s = Student(name: "阿达", num: "110")
print(s.name)



//  -----用KVC实现构造函数-----

/*
 1、定义模型属性的时候，如果是对象，通常是可选的
 好处：1、在需要的时候创建 2、避免写构造函数
 2、如果是基本数据类型，不能设置成可选的，而且要设置初始值，否则KVC会崩溃
 3、使用KVC方法之前，应该调用super.init 保证对象实例化完成
 4、如果需要使用KVC设置数值，属性不能是private的
 */
class kPerson: NSObject {
    
    /*
     name 属性是可选的，再OC中很多的属性都是在需要的时候创建的
     例如 vc.view ／ tableViewCell.text.Label等
     因为在手机开发中，内存很宝贵，有些属性并不是一定需要分配空间的
     延迟加载，在需要的时候再创建
     */
    var name: String?
    
    /*
     给基本数据类型初始化
     使用KVC会提示无法找到age 的 KEY
     是因为Int 是一个基本数据类型的结构体，OC中没有，OC中只有基本数据类型
     */
    var age: Int = 0
    //如果是private属性 使用kvc设置的时候，也无法设置
    private var title: String?
    
    init(dict: [String :Any]) {
        //保证对象已经完全初始化完成
        super.init()
        //KVC的方法是OC的方法，也就是说在运行时给对象发送消息
        //要求对象已经实例化完成了 所以要先super.init
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //没有调用super 奖父类的实现代码完全覆盖了，字典里加入没有定义的KEY不会崩溃
    }
}

let kp = kPerson(dict: ["name": "阿达7","age":23])
print(kp.name,kp.age)

//如果子类没有重写父类的方法，调用的时候会直接调用父类方法
class kStudent: kPerson{
    var num: String?
}

let ks = kStudent(dict: ["name":"阿达","num":"19"])
print(ks.name,ks.num)



// ------Swift用运行时加载属性列表-----

class man: NSObject {
    var name: String?
    var age: String?
    var title: String?
    //获取当前类所有属性的数组
    class func propertyList() -> [String] {
        var count: UInt32 = 0
        
        // 1、返回属性列表的数组,可选项
        let list = class_copyPropertyList(self, &count)
        // 2、遍历数组
        for i in 0..<Int(count) {
            /*  强行解包写法
             let property = list?[i]
             //c语言的字符串
             let cName = property_getName(property!)
             let str = String(utf8String: cName!)
             print(str!)
             */
            
            //用guard let 守护 写法
            guard let property = list?[i],
                let cName = property_getName(property),
                let str = String(utf8String: cName)
                else{
                    continue
            }
            print(str)
        }
        
        //3 释放c语言对象
        free(list)
        return []
    }
}

man.propertyList()




// -----便利构造函数-----

/*
 目的：
 1、条件判断，只有满足条件，才实例化对象，可以防止不必要的内存开销
 2、简化对象创建
 3、本身不负责属性的创建和初始化工作
 */

class con: NSObject {
    var name: String?
    var age: Int = 0
    
    /*
     1、便利构造函数允许返回nil
        正常的构造函数一定会创建对象
        而便利构造函数判断给定的参数是否符合条件，如果不符合条件，直接返回nil,不会创建对象，减少内存开销
     2、只有便利构造函数中使用 'self.init' 构造当前对象
        没有convenience关键字的构造函数是负责创建对象的，有是用来检查条件的，本身不负责对象的创建
     3、如果要再便利构造函数中使用当前对象的属性，一定要在self.init之后
     */
    convenience init?(name: String,age: Int) {
        if age > 100 {
            return nil
        }
        self.init()
        self.name = name
    }
}
