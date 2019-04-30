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
import RxDataSources
import Charts

typealias UnsaeDataSource = RxTableViewSectionedReloadDataSource<SectionOfUnsae>

class ViewController: UIViewController {
    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var gaugeView: Gauge!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var luckOfColor: UIView!
    @IBOutlet weak var numOfLuck: UILabel!
    @IBOutlet weak var directionOfLuck: UILabel!
    @IBOutlet weak var unsaeScoreLabel: UILabel!
    @IBOutlet weak var unsaeTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unsaeMainLabel: UILabel!
    @IBOutlet weak var totalLuckLabel: UILabel!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var chongUnLabel: UILabel!
    @IBOutlet weak var radarChartView: RadarChartView!
    
    @IBOutlet weak var colorImageView1: UIImageView!
    @IBOutlet weak var colorImageView2: UIImageView!
    @IBOutlet weak var colorImageView3: UIImageView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    
    private let unsaeCellFileName = "UnsaeCell"
    private let unsaeCellIdentifier = "unsaeCell"
    private let todayUnsae = TodayUnsaeViewModel()
    
    let components = ["애정운","학업운","사업운","건강운","금전운"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gaugeView.rate = 0

        setChart()
        setupUnsaeTable()
        unsaeViewBindUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewHeight.constant = unsaeTableView.contentSize.height
        viewInit()
        scoreAnimate()
    }
    

    private func scoreAnimate(){
        _ = todayUnsae.unsaeScore.subscribe(onNext:{ gaugeValue in
            self.gaugeView.rate = CGFloat(gaugeValue)
        })
        
        _ = todayUnsae.unsaeScore
            .map{"\($0)"}
            .bind(to: unsaeScoreLabel.rx.text)
        
    } // View Animation Part
    
    private func viewInit(){
        gaugeView.maxValue = 100
        
        profileView.profileImageView.toCircleImage()
        colorImageView1.toCircleImage()
        colorImageView2.toCircleImage()
        colorImageView3.toCircleImage()
        
        luckOfColor.layer.cornerRadius = 7
        numOfLuck.layer.cornerRadius = 7
        directionOfLuck.layer.cornerRadius = 7
        
        luckOfColor.layer.borderWidth = 1.5
        numOfLuck.layer.borderWidth = 1.5
        directionOfLuck.layer.borderWidth = 1.5
        luckOfColor.layer.borderColor = UIColor.init(rgb: 0x009379).cgColor
        numOfLuck.layer.borderColor = UIColor.init(rgb: 0x009379).cgColor
        directionOfLuck.layer.borderColor = UIColor.init(rgb: 0x009379).cgColor
        
        scrollView.bounces = false
        
    } // View Initializer
    
    private func unsaeViewBindUI() {
        
        _ = todayUnsae.profileModel
            .map{$0.profileBirth}
            .bind(to: profileView.profileBirthLabel.rx.text)
        
        _ = todayUnsae.profileModel
            .map{$0.profileName}
            .bind(to: profileView.profileNameLabel.rx.text)
        
        _ = todayUnsae.profileModel
            .map{$0.profileImage}
            .bind(to: profileView.profileImageView.rx.image)
        
        _ = todayUnsae.unsaeModel
            .map{$0.totalLuck}
            .bind(to: totalLuckLabel.rx.text)
        
        _ = todayUnsae.unsaeModel
            .map{$0.unsaeMain}
            .bind(to: unsaeMainLabel.rx.text)
        
        _ = todayUnsae.unsaeModel
            .map{$0.date}
            .bind(to: dateLabel.rx.text)
        
        _ = todayUnsae.unsaeModel.subscribe(onNext:{
            self.setChartData(entries: $0.entries)
        })
        
        _ = todayUnsae.thingOfLuckModel
            .map{ thingOfLuckModel -> String in
                if thingOfLuckModel.unsaeNumCount == 1 {
                    return "\(thingOfLuckModel.unsaeNum[0])"
                }
                else {
                    return "\(thingOfLuckModel.unsaeNum[0]),\(thingOfLuckModel.unsaeNum[1])"
                }
            }
            .bind(to: numOfLuck.rx.text)
        
        _ = todayUnsae.thingOfLuckModel
            .map{ thingOfLuckModel -> String in
                if thingOfLuckModel.unsaeDirectionCount == 1 {
                    return "\(thingOfLuckModel.unsaeDirection[0])"
                }
                else {
                    return "\(thingOfLuckModel.unsaeDirection[0]),\(thingOfLuckModel.unsaeDirection[1])"
                }
            }
            .bind(to: directionOfLuck.rx.text)
        
        _ = todayUnsae.thingOfLuckModel.subscribe(onNext:{
            if $0.unsaeColor.count == 1 {
                self.colorImageView2.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[0]).cgColor
                self.colorImageView2.makeShadow()
            }
            else if $0.unsaeColor.count == 2 {
                self.colorImageView1.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[0]).cgColor
                self.colorImageView3.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[1]).cgColor
                self.colorImageView3.makeShadow()
                self.colorImageView1.makeShadow()
            }
            else {
                self.colorImageView1.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[0]).cgColor
                self.colorImageView2.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[1]).cgColor
                self.colorImageView3.layer.backgroundColor = UIColor.init(rgb: $0.unsaeColor[2]).cgColor
                self.colorImageView2.makeShadow()
                self.colorImageView1.makeShadow()
                self.colorImageView3.makeShadow()
            }
        })
        
        
    } // Bind View
    
}

extension ViewController : UITableViewDelegate { // tableView
    
    private func setupUnsaeTable() {
        
        unsaeTableView.separatorStyle = .none
        unsaeTableView.isScrollEnabled = false
        unsaeTableView.allowsSelection = false
        
        let nibName = UINib.init(nibName: unsaeCellFileName, bundle: nil)
        self.unsaeTableView.register(nibName, forCellReuseIdentifier: unsaeCellIdentifier)
        
        let dataSource = UnsaeDataSource(configureCell: { ds, tv, ip, item in
            let cell = tv.dequeueReusableCell(withIdentifier: self.unsaeCellIdentifier) as! UnsaeCell
            
            cell.unsaeLabel.text = item.unsaeLuck
            cell.unsaeImageView.image = item.unsaeimage
            
            return cell
        })
        
        
        _ = todayUnsae.dataSource
            .bind(to: unsaeTableView.rx.items(dataSource: dataSource))
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
} // Table View

extension ViewController : IAxisValueFormatter { // ChartView
    
    private func setChart() {
        
        radarChartView.chartDescription?.enabled = false
        radarChartView.legend.enabled = false
        radarChartView.webColor = .darkGray
        radarChartView.webAlpha = 1
        radarChartView.webLineWidth = 1
        radarChartView.innerWebLineWidth = 0.6
        radarChartView.rotationEnabled = false
        
        let xAxis = radarChartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 15, weight: .bold)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        
        let yAxis = radarChartView.yAxis
        yAxis.labelCount = 6
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 90
        yAxis.drawLabelsEnabled = false
 
    }
    
    private func setChartData(entries : [RadarChartDataEntry]) {
        
        let set = RadarChartDataSet(entries: entries, label: nil)
        set.drawFilledEnabled = true // 내부 색칠
        set.fillAlpha = 0.7 // 내부 색칠 알파값
        set.lineWidth = 1 // 내부 윤곽의 두께
        
        let data = RadarChartData(dataSets: [set])
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setDrawValues(false)
        
        radarChartView.data = data
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return components[Int(value) % components.count]
    }
    
    
} // ChartView
