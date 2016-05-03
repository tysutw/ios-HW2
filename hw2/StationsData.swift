//
//  StationsData.swift
//  hw2
//
//  Created by TsungYen Su on 4/30/16.
//  Copyright © 2016 TsungYen Su. All rights reserved.
//

import Foundation
import ObjectMapper

struct Line{
    let name: String
    let stations: [Station]
}

struct Station{
    var name: String!
    var coordinate: [Double]!
    var lines: [String:String]!
}

extension Station: Mappable {
    init? (_ map: Map) {
        
    }
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.coordinate <- map["coordinate"]
        self.lines <- map["lines"]
    }
}

struct StationsSource {
    
    let lines: [Line]
    
    init(contentsOfFile path: String) throws {
        
        let jsonContent = try! String(contentsOfFile: path)
        let stationsArray = Mapper<Station>().mapArray(jsonContent)!
        
        var lineStationMap = [String :[Station]]()
        for s in stationsArray {
            for (l,_) in s.lines {
                if lineStationMap[l] == nil {
                    lineStationMap[l] = []
                }
                lineStationMap[l]!.append(s)
            }
        }
        
        var _lines = [Line]()
        for (lineName, stations) in lineStationMap {
            let line = Line(name: lineName, stations: stations)
            _lines.append(line)
        }
        self.lines = _lines.sort { (lineA: Line, lineB: Line) -> Bool in
            return lineA.name < lineB.name
        }
        
    }
}


