//
//  StationsListViewController.swift
//  hw2
//
//  Created by TsungYen Su on 4/30/16.
//  Copyright © 2016 TsungYen Su. All rights reserved.
//

import UIKit

class StationsListViewController: UITableViewController {
    
    var stationsData: StationsSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        let dataPath = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")!
        guard let stationsSource = try? StationsSource(contentsOfFile: dataPath) else {
            fatalError()
        }
        self.stationsData = stationsSource
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.stationsData.lines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stationsData.lines[section].stations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let station = self.stationsData.lines[indexPath.section].stations[indexPath.row]
        var chNames: [String] = []
        var ids: [String] = []
        
        for (k,v) in station.lines{
            chNames.append(k)
            ids.append(v)
        }
        
        if station.lines.count == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("oneLineCell", forIndexPath: indexPath) as! oneLineTableViewCell
            cell.stationNameLabel.text = station.name
            cell.firstLineNameLabel.text = ids[0]
            cell.firstLineNameLabel.backgroundColor = LineToColor(chNames[0])
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("twoLinesCell", forIndexPath: indexPath) as! twoLinesTableViewCell
            cell.stationNameLabel.text = station.name
            cell.firstLineNameLabel.text = ids[0]
            cell.firstLineNameLabel.backgroundColor = LineToColor(chNames[0])
            cell.secondLineNameLabel.text = ids[1]
            cell.secondLineNameLabel.backgroundColor = LineToColor(chNames[1])
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.stationsData.lines[section].name
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
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "ShowDetailSingle" {
            guard let detailViewController = segue.destinationViewController as? SingleLineStationDetailViewController else {
                return
            }
            guard let cell = sender as? UITableViewCell else { return } //why?
            let indexPath = self.tableView.indexPathForCell(cell)!
            let station = self.stationsData.lines[indexPath.section].stations[indexPath.row]
            detailViewController.station = station
        }
        
        else if segueIdentifier == "ShowDetailMultiple" {
            guard let detailViewController = segue.destinationViewController as? MultipleLinesStationDetailViewController else {
                return
            }
            guard let cell = sender as? UITableViewCell else { return } //why?
            let indexPath = self.tableView.indexPathForCell(cell)!
            let station = self.stationsData.lines[indexPath.section].stations[indexPath.row]
            detailViewController.station = station
        }
    }
    

}
