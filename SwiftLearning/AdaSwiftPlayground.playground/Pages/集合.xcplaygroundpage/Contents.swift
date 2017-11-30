

import Foundation
import UIKit

//  ------数组的定义---------


// 自动推导的类型 [String] -- 数组中都是字符串
let array = ["ada1","ada2","ada3"]

// [Int] -- 数组中都是整数
// Swift中 基本数据类型不需要包装
let array1 = [1,2,3,4,5]

//结构体
let p = CGPoint(x: 100, y: 100)
let array3 = [p]

//混合类型的 数组
//开发中用的极少，因为数组靠下标索引

//数组中类型不一致 自动推导的是Any 
//Swift中还有一种AnyObject类型 表示任意对象 Swift中一个类可以没有父类
let array4:[Any] = ["ada1", 18, p]


//-------数组遍历---------

// 1、按照下标遍历
for i in 0..<array.count {
    print(array[i])
}
print("1------")


// 2、遍历元素
for str in array {
    print(str)
}
print("2------")


// 3、OC 中 enum block 遍历 在Swift中的使用（1）
for e in array.enumerated(){
// e: (offset: Int, element: String) 通过option + click(单击)查看
// e 这是Swift中的元组
    print(e.offset,e.element)
}
print("3-------")


// 4、OC 中 enum block 遍历 在Swift中的使用（2）
for (num,str) in array.enumerated() {
    print(num,str)
}
print("4-------")

// 5、反序遍历
for str in array.reversed(){
    print(str)
}
print("5-------")


// 6、反序的下标+内容遍历
for (num,str) in
    array.enumerated().reversed(){//这里要先得到下标和内容 再反序 否则索引和内容不一致
    print(num,str)
}


// ------数组的增删改------

// Swift中可变、不可变数组通过var / let 决定
var myArray = ["ada1","ada2","ada3","ada4"]

//追加元素
myArray.append("ada5")
//修改元素
myArray[0] = "ada0"
//删除元素
myArray.remove(at: 4)

print(myArray)

//删除全部并且保留空间
myArray.removeAll(keepingCapacity: true)
print(myArray.capacity)


//----数组的空间

var arrayC = [Int]() //初始化
for i in 0..<8 {
arrayC.append(i)
    print("\(arrayC)--空间 \(arrayC.capacity)")
    //可以看出空间不足时，空间容量会 * 2
}


//----数组的合并

var array10 = ["1","2","3"]
var array11 = ["4","5"]
array10 += array11
//array10 += arrayC 这个会报错 合并要同类型的
print(array10)



print("------------字典---------------")

// ------------字典---------------

//定义 Swift中 用[]定义字典
let dic:[String:Any] = ["name":"阿达","age":23]

//字典数组 使用的最多的
//因为JSON 用的最多 JSONSerialization类 文档
 /* 
    JSONSerialization
    A class for converting JSON to Foundation objects and converting Foundation objects to JSON.
   An object that may be converted to JSON must have the following properties:
 - Top level object is an NSArray or NSDictionary
 - All objects are NSString, NSNumber, NSArray, NSDictionary, or NSNull
 - All dictionary keys are NSStrings
 - NSNumbers are not NaN or infinity
*/

let dicArray:[[String:Any]] = [["name":"阿达","age":23],["name":"阿达7","age":30]]


//----字典的增删改-------

// 可变 var 不可变 let 
var dict:[String:Any] = ["name":"阿达7","age":30]
dict["sex"] = "male"
dict["name"] = "阿达8"
print(dict)
//从上面打印结果可以看出 key 如果不存在 则新增 如果存在则修改

dict.removeValue(forKey: "sex")
print(dict)


print("----遍历----")
//-----字典的遍历--------
for e in dict{
    print("\(e.key) \(e.value)")
}

for (key,value) in dict{
    print("\(key) \(value)")
}


//----字典的合并----

var dict1:[String:Any] = ["name":"阿达7","age":30]
let dict2 = ["name":"阿达","sex":"male"]

for e in dict2{
    dict1[e.key] = dict2[e.key]
    print(dict1)
}











