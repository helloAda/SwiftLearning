

import Foundation


// ------字符串-------

let str = "hello ada 你好"


//遍历  这种方式 只支持 String结构体  不支持NSString
for s in str.characters{
    print(s)
}
//返回指定编码的对应字节数 utf8 (0-4) 汉字3个
print(str.lengthOfBytes(using: .utf8))

//返回字符串长度 --即字符的个数  推荐用这个
print(str.characters.count)


//使用NSString 求字符个数
// as 表示类型转换
let OCStr = str as NSString
print(OCStr.length)



// -----拼接-------
let name = "阿达"
let age = "23"

let my = "\(name)今年\(age)"


//------格式化---------
let h = 16
let m = 41
let s = 10
let dateStr = String(format: "%d:%d:%d", h,m,s)
print(dateStr)



//------字符串的字串--------

// 1、NSString的方法
let OCString = str as NSString
let s1 = OCStr.substring(with: NSMakeRange(6,3))
print(s1)

// 2、String 3.0方法 比较麻烦

//str.substring(with: <#T##Range<String.Index>#>)
/*
    Index
    str.startIndex 字符串开始
    str.endIndex  字符串长度
 */
let s2 = str.substring(from: "abc".endIndex)


// 取字串的范围
func demo(){
    guard let range = str.range(of: "你好") else{return}
    print(str.substring(with: range))
}
demo()


