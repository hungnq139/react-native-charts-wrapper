//  Created by xudong wu on 24/02/2017.
//  Copyright wuxudong
//

import Charts
import SwiftyJSON

class RNPieChartView: RNChartViewBase {
    let _chart: PieChartView;
    let _dataExtract : PieDataExtract;

    override var chart: PieChartView {
        return _chart
    }

    override var dataExtract: DataExtract {
        return _dataExtract
    }
  
    override init(frame: CoreGraphics.CGRect) {

        self._chart = PieChartView(frame: frame)
        self._dataExtract = PieDataExtract()

        super.init(frame: frame)

        self._chart.delegate = self
        self.addSubview(_chart)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDrawSliceText(_ enabled: Bool) {
        chart.drawEntryLabelsEnabled = enabled
    }


    func setUsePercentValues(_ enabled: Bool) {
        chart.usePercentValuesEnabled = enabled
    }


    func setCenterText(_ text: String) {
        chart.centerText = text
    }

    func setDrawEntryLabels(_ enabled: Bool) {
        chart.drawEntryLabelsEnabled = enabled
    }

    func setExtraOffsets(_ offSets: [Float]) {
      chart.setExtraOffsets(left: CGFloat(offSets[0]), top: CGFloat(offSets[1]), right: CGFloat(offSets[2]), bottom: CGFloat(offSets[3]))
    }

    func setCenterTextRadiusPercent(_ radiusPercent: NSNumber) {
        chart.centerTextRadiusPercent = CGFloat(truncating: radiusPercent) / 100.0
    }


    func setHoleRadius(_ percent: NSNumber) {
        chart.holeRadiusPercent = CGFloat(truncating: percent) / 100.0
    }


    func setHoleColor(_ color: Int) {
        chart.holeColor = RCTConvert.uiColor(color)
    }


    func setTransparentCircleRadius(_ percent: NSNumber) {
        chart.transparentCircleRadiusPercent = CGFloat(truncating: percent) / 100.0
    }

    func setTransparentCircleColor(_ color: Int) {
        chart.transparentCircleColor = RCTConvert.uiColor(color)
    }

    func setEntryLabelColor(_ color: Int) {
        chart.entryLabelColor = RCTConvert.uiColor(color)
    }

    func setEntryLabelTextSize(_ size: NSNumber) {
        chart.entryLabelFont = chart.entryLabelFont?.withSize(CGFloat(truncating: size))
    }

    func setMaxAngle(_ maxAngle: NSNumber) {
        chart.maxAngle = CGFloat(truncating: maxAngle)
    }

    func setRotationEnabled(_ enabled: Bool) {
        chart.rotationEnabled = enabled
    }

    override func didSetProps(_ changedProps: [String]!) {
        super.didSetProps(changedProps)
        
        let pieChartDataSet = chart.data?.dataSets[0] as? PieChartDataSet

        pieChartDataSet?.entryLabelColor = chart.entryLabelColor
        pieChartDataSet?.entryLabelFont = chart.entryLabelFont
    }
}
