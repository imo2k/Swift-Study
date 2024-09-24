import UIKit

// 매개변수 기본값
func greeting(friend: String, me: String = "o2k") {
    print("Hello \(friend)! I'm \(me)")
}
// 매개변수 기본값을 가지는 매개변수는 생략 가능
greeting(friend: "haha") // me 매개변수는 "o2k"라는 기본값을 가지기 때문에 생략 가능
greeting(friend: "john", me: "eric")

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용함
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}
// 함수를 호출할 때에는 전달인자 레이블을 사용해야함
greeting(to: "haha", from: "o2k")

// 가변 매개변수
// 전달 받을 값의 개수를 알기 어려울 때 사용 가능
// 함수당 하나만 가질 수 있음
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}
print(sayHelloToFriends(me: "o2k", friends: "A", "B", "C"))
print(sayHelloToFriends(me: "o2k"))

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "o2k")

someFunction = greeting(to:from:)

someFunction("eric", "o2k")

// 타입이 다른 함수는 할당할 수 없음
//someFunction = sayHelloToFriends(me: friends:)
// Cannot assign value of type '(String, String...) -> String' to type '(String, String) -> Void' 오류 발생

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}
runAnother(function: greeting(to:from:))
runAnother(function: someFunction)
