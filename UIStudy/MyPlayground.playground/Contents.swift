import UIKit
import Foundation
import RxSwift


Observable<Int>.timer(0, period: 0.02, scheduler: MainScheduler.instance)
    .take(100)
    .map{Double($0)/100}
    .subscribe(onNext:{
        print($0)
    })



var unsaeNum = [Int]()

unsaeNum.append(Int.random(in: 0..<21))


let new = Int.random(in: 0..<21)
if  new != unsaeNum[0]{
    unsaeNum.append(new)
}
