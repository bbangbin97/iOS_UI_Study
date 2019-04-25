//
//  TodayUnsaeViewModel.swift
//  UIStudy
//
//  Created by 정영빈 on 17/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TodayUnsaeViewModel {
    
    
    public let dataSource : Observable<[SectionOfUnsae]>
    
    public let profileModel : Observable<ProfileModel>
    public let unsaeModel : Observable<UnsaeModel>
    public let thingOfLuckModel : Observable<ThingOfLuckModel>
    public let unsaeScore : Observable<Int>
    
    init(){
        
        profileModel = ModelCreator.getProfileModel()
        
        unsaeModel = ModelCreator.getUnsaeModel().share(replay: 1)
        
        unsaeScore = unsaeModel
            .flatMapLatest{Observable.timer(0, period: 0.02, scheduler: MainScheduler.instance).take($0.unsaeScore)}.share(replay: 1)
        
        dataSource = ModelCreator.getUnsaeTable()
        
        thingOfLuckModel = ModelCreator.getThingOfLuck()
        
        
    }
    
    
}
