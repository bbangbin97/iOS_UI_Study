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
    
    init(){
        
        profileModel = ModelCreator.getProfileModel()
        unsaeModel = ModelCreator.getUnsaeModel()
        
        dataSource = ModelCreator.getUnsaeTable()
        
 
    }
    
}
