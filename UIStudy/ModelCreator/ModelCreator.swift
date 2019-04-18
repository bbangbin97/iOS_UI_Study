//
//  File.swift
//  UIStudy
//
//  Created by 정영빈 on 17/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources



class ModelCreator {
    
    static func getProfileModel() -> Observable<ProfileModel> {
        let profileModel = ProfileModel()
        
        return Observable.just(profileModel)
    }
    
    static func getUnsaeModel() -> Observable<UnsaeModel> {
        let unsaeModel = UnsaeModel()
        
        return Observable.just(unsaeModel)
    }
    
    
    
    static func getUnsaeTable()-> Observable<[SectionOfUnsae]>{
        let unsaModel = UnsaeModel()
        
        return Observable.just([SectionOfUnsae(header: "1", items: unsaModel.unsaeData)])
    }
}
