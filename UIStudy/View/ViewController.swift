//
//  ViewController.swift
//  UIStudy
//
//  Created by 정영빈 on 15/04/2019.
//  Copyright © 2019 정영빈. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import GaugeKit


class ViewController: UIViewController {
    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var gaugeView: Gauge!
    
    @IBOutlet weak var LineView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileView.profileImageView.toCircleImage()
    }
    
    func bindUI() {
        profileView.profileImageView.image = UIImage(named: "imageforTest")
    }

}

