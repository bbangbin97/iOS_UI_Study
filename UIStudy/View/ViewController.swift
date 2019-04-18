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
    
    @IBOutlet weak var unsaeTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unsaeMainLabel: UILabel!
    @IBOutlet weak var totalLuckLabel: UILabel!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var chongUnLabel: UILabel!
    @IBOutlet weak var radarChartView: RadarChartView!
    
    private let unsaeCellFileName = "UnsaeCell"
    private let unsaeCellIdentifier = "unsaeCell"
    private let todayUnsae = TodayUnsaeViewModel()
    
    let components = ["애정운","학업운","사업운","건강운","금전운"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart()
        setupUnsaeTable()
        unsaeViewBindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileView.profileImageView.toCircleImage()
        gaugeViewAnimation()
        
        scrollContentView.frame = CGRect(x: 0, y: 0, width: scrollContentView.frame.width, height: getHeight())
        print("getHeight\(getHeight())")
        print(scrollContentView.frame.height)
        print("table \(unsaeTableView.frame.height)")
    }
    
    private func gaugeViewAnimation(){
        
        //        let randnum = Int.random(in: 50..<100)
        //
        //        let timer = Observable<Int>.timer(0,period: 0.05,scheduler: MainScheduler.instance)
        
        
    }
    
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
        
    }
    
    func getHeight() -> CGFloat {
        let height = gaugeView.frame.height + chongUnLabel.frame.height + totalLuckLabel.frame.height + radarChartView.frame.height + unsaeTableView.contentSize.height + CGFloat(75)
        
        return height
    }
    
}

extension ViewController { // tableView
    
    private func setupUnsaeTable() {
        
        unsaeTableView.separatorStyle = .none
        unsaeTableView.isScrollEnabled = false
        
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
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController {
    
    private func setChart() {
        
        radarChartView.chartDescription?.enabled = false
        radarChartView.legend.enabled = false
        radarChartView.webColor = .darkGray
        radarChartView.webAlpha = 1
        radarChartView.webLineWidth = 1
        radarChartView.innerWebLineWidth = 0.6
        radarChartView.yAxis.drawLabelsEnabled = false
        
        let xAxis = radarChartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 15, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        
        let yAxis = radarChartView.yAxis
        yAxis.labelCount = 6
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 90
        yAxis.drawLabelsEnabled = false
        
        setChartData()
        
    }
    
    private func setChartData() {
        let cnt = 5
        
        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double.random(in: 70..<90))}
        let entries1 = (0..<cnt).map(block)
        
        let set1 = RadarChartDataSet(entries: entries1, label: "Last Week")
        set1.setColor(UIColor.init(rgb: 0x9CFFFB))
        set1.fillColor = UIColor.init(rgb: 0x9CFFFB)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 1
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set1])
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setDrawValues(false)
        
        radarChartView.data = data
    }
    
    
}

extension ViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return components[Int(value) % components.count]
    }
}
