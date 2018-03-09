//: Playground - noun: a place where people can play

import UIKit

//闭包（closure）的学习和使用

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//闭包函数
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

func startSort() -> Void {
    let  reversedNames = names.sorted(by: backward)
    let str = "result0 == \(reversedNames)"
    
    print(str)
}

//闭包表达式
let des = { (s1:String,s2:String)->Bool in return s1>s2 }

func startSort1() -> Void {
    let  reversedNames = names.sorted(by: des)
    print("result1 == \(reversedNames)")
}

//根据上下文推断类型,内联式闭包表达式
//{ s1, s2 in return s1 > s2 }
//实际上，通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。这意味着闭包作为函数或者方法的参数时，你几乎不需要利用完整格式构造内联闭包
//单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
//{ s1, s2 in s1 > s2 }

//Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推
//{ $0 > $1 }

//运算符方法 (真厉害-->类型推断)
//Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断出你想使用大于号的字符串函数实现
// >
func startSort2() -> Void {
    let  reversedNames = names.sorted(by: >)
    print("result2 == \(reversedNames)")
}
//尾随闭包
func startSort3() -> Void {
    let  reversedNames = names.sorted(){ $0 > $1 }
    print("result3 == \(reversedNames)")
}
//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
func startSort4() -> Void {
    let  reversedNames = names.sorted{ $0 > $1 }
    print("result4 == \(reversedNames)")
}

startSort()
startSort1()
startSort2()
startSort3()
startSort4()


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//尾随闭包表达式
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
//        print(output)

        number /= 10
    } while number > 0
    return output
}
print("strings == \(strings)")


//逃逸闭包
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的

var completionHandlers: [() -> Void] = []



func someFunctionWithEscapingClosure(completionHandler:@escaping ()->Void) {
   completionHandlers.append(completionHandler)
    
}

//非逃逸闭包
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
//String
print()
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"

completionHandlers.first?()
print(instance.x)
// 打印出 "100"

//类型重定义
typealias HqHandler = (_ str:String)->Void
//@escaping 逃逸闭包
func startRequest( handler: @escaping HqHandler ) {
    handler("{\"name\":\"xiaoming\"}");
}
startRequest { (str:String) in
    print("请求完成 == \(str)")
}


