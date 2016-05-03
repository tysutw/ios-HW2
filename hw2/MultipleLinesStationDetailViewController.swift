//
//  MultipleLinesStationDetailViewController.swift
//  hw2
//
//  Created by TsungYen Su on 5/3/16.
//  Copyright © 2016 TsungYen Su. All rights reserved.
//

import UIKit

class MultipleLinesStationDetailViewController: UIViewController {

    var station: Station? {
        didSet {
            self.updateValues()
        }
    }
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var firstLineNameLabel: UILabel!
    @IBOutlet weak var secondLineNameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateValues()
    }
    
    func updateValues() {
        guard self.isViewLoaded() else {
            return
        }
        self.stationNameLabel.text = station?.name
        var chNames: [String] = []
        for (k,_) in self.station!.lines{
            chNames.append(k)
        }
        firstLineNameLabel.text = chNames[0]
        firstLineNameLabel.backgroundColor = LineToColor(chNames[0])
        secondLineNameLabel.text = chNames[1]
        secondLineNameLabel.backgroundColor = LineToColor(chNames[1])
    }
    
    func LineToColor(name: String) -> UIColor{
        switch name {
        case "文湖線" :
            return UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
        case "淡水信義線" :
            return UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
        case "新北投支線" :
            return UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
        case "松山新店線" :
            return UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
        case "小碧潭支線" :
            return UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
        case "中和新蘆線" :
            return UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
        case "板南線" :
            return UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
        case "貓空纜車" :
            return UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
        default:
            return UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
