//
//  UnsaeModel.swift
//  UIStudy
//
//  Created by 정영빈 on 17/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources
import Charts


struct Unsae{
    var unsaeimage : UIImage
    var unsaeLuck : String
}

struct SectionOfUnsae  {
    var header : String
    var items : [Item]
}

extension SectionOfUnsae : SectionModelType {
    typealias Item = Unsae
    
    init(original: SectionOfUnsae, items: [Item]) {
        self = original
        self.items = items
    }
}

class UnsaeModel {
    
    let unsaeMain : String
    let totalLuck : String
    let date : String
    let unsaeScore : Int
    
    let unsaeLuck = ["상대방에게 너무 많은 것을 의지하고 요구하고 있는 것은 아닌지 진지하게 생각해 보아야 할 것입니다. 아무리 연인이라고 해도 너무 많은 기대나 요구는 상대방으로 하여금 부담으로 작용할 수 있는 부분입니다. 당신이 상대방을 사랑하는 마음이 크기 때문에 그러는 것은 당연하지만 그것이 정도를 지나치게 되면 자칫 상대방의 마음에 변화를 갖게 할 수 있습니다. 단순히 남자라는 이유로, 여자라는 이유로 라고 갖다 붙이는 것은 좋지 않으니 자신이 먼저 신경 써보도록 하십시오.","노력하는 것만큼 가장 확실하게 성적을 올리는 방법은 없습니다. 다만 그것은 꾸준히 하는 것이 가장 포인트인데 꾸준히 하는 것 자체가 어렵다는 것이 문제가 되겠지요. 자신에게 맞는 공부 방법을 찾는 것도 중요하지만, 기껏 방법을 찾아 놓고 게으르다면 성적이 오를 리는 없습니다. 열심히 하는 것은 정직하게, 아무것도 속이지 않고 성과를 얻을 수 있는 최선의 방법입니다. 오늘은 노력하면 성과가 있기는 하지만 안타깝게도 노력한 만큼 100%반영되지는 못하는 날입니다. 능률의 문제도 있겠고, 책상에 앉아 있는 시간과 성과가 완전히 비례하지는 않는다는 것은 누구나 알고 있는 사실이지만 속상한 일이기는 합니다. 열심히 하는데도 공부가 잘 되지 않는다면 힘든 것은 당연하겠지요. 오늘은 왠지 집중이 잘 되지 않는 날이라고 보는 것이 타당하겠군요. 내내 앉아서 집중하려고 노력하는 것보다는 짬짬이 머리를 식히면서 한숨 돌려가며 공부하는 편이 능률이 좋을지도 모릅니다. 노력한 만큼 완전히 성과가 나오는 날이 아니니 필요 이상으로 열을 내지는 않는 것이 좋습니다.","평소 신경질이 잦은 상사를 두고 있는 사람에게는 피곤한 날입니다. 중요한 결재 받을 일이나 뒤로 미뤄서는 안 되는 일이 있는데 상사의 기분이 좋지 않아 당신에게 쉽사리 결재를 내려주지 않습니다. 무슨 일이 있었는지는 모르지만 사적인 일을 공적인 일에까지 개입시키다니 뭐라고 한 마디 해주고 싶은 심정입니다. 하지만 지금 그랬다가는 오히려 역효과. 당신이 하고자 하는 일마저 못하게 될 수 있습니다. 이런 때는 상사를 살살 구슬리는 것이 좋습니다. 그의 비위를 맞춰주고 말에 맞장구를 쳐주어 기분을 풀게 한다면 분명히 금새 일의 결재를 받을 수 있습니다. 굳이 상사와 관련된 중요한 일이 없는 사원이라도 상사의 기분을 풀어주기 위해 무언가 하는 편이 좋습니다. 이렇게까지 비굴하게 해야 하나라고 생각하겠지만, 상사의 기분이 계속 이지러진 채로 있다면 사무실 내에 드리운 먹구름은 사라지지 않을 것이니까요. 그의 비위를 잘 맞추어 직장의 여러 사람에게 피해가 가는 일이 없도록 조처하세요.","이 괘의 건강에 대한 관점을 살펴보면 건강상의 큰 이상은 없다고 볼 수 있겠습니다. 그러나 예방에 대해서는 유념해야 하는 정도입니다. 소화계통, 신경계통과 습진, 무좀등의 질병에 주의할 때 입니다. 건강의 이상은 잔병치레 정도의 수준입니다. 그러나 이 또한 방치하면 큰 병과 같습니다. 환절기에 건강을 각별히 주의하여야 할 것이며, 특히 호흡기 질환에 걸리지 않도록 주의해야 합니다.","남들이 보기엔 충분한 소득을 올리고 있는 것으로 보이지만 정작 본인의 성에는 차지 않는 것이 오늘의 모습입니다. 자신이 자신의 능력에 걸맞게 목표를 해둔 것이 있다면 그에 대한 기대로 인해 실망이 클 것입니다. 또한 자신의 능력에 대해 회의를 느끼게 되는 일도 생길 수 있습니다. 이런 때일 수록 조금만 기대를 낮추어 보는 것은 어떨까요. 당신이 노력하는 만큼 언젠가는 그 대가를 받을 수 있다는 것을 기억하세요. 또한 로또를 구매할 때 보다는 손이 가는 대로 숫자를 택해 보십시오."]
    
    let unsaeimage = [UIImage(named: "ic_fortune_love")!,UIImage(named: "ic_fortune_study")!,UIImage(named: "ic_fortune_business")!,UIImage(named: "ic_fortune_health")!,UIImage(named: "ic_fortune_money")!]
    
    let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double.random(in: 70..<90))}
    let entries : [RadarChartDataEntry]
    
    var unsaeData = [Unsae]()
    
    
    init(){
        
        date = "2019.04.17 수요일"
        unsaeMain = "싸움터로 출전하는 장군이 하늘에서 내려 온 신검을 쥐고 장도에 오르니 후퇴할 줄 모르는 강한 일진입니다."
        totalLuck = "약간 부족한 점이 있는 듯 하면서도 생각하기에 따라서는 얼마든지 많은 것을 이루어 나갈 수 있는 날입니다. 모든 것은 자신의 마음먹기에 달린 것입니다. 자신이 마음을 다잡지 못하고 흔들리고 있다면 그것은 결국 자신의 마음에 혼란을 부르는 것입니다. 또한 완벽한 것만을 추구하려고 하지 마십시오. 당신이 현재 보여지는 것만으로도 충분히 완벽할 수 있습니다. 또한 어렵게 생각하지 마시고 평소와 같되 조금 더 자신감 있는 모습으로 세상을 대하려는 태도가 무엇보다 필요합니다."
        
        unsaeScore = Int.random(in: 50..<100)
        
        entries = (0..<5).map(block)
        
        for i in 0..<5 {
            let newE = Unsae(unsaeimage: unsaeimage[i], unsaeLuck: unsaeLuck[i])
            unsaeData.append(newE)
        }
    }
    
}
