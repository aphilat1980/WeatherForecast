//
//  Chart.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 23.08.2023.
//

import Foundation
import SwiftUI
import Charts

struct LineChart: View {
    
    var data = DataManager.shared.weathers[0...7]
    
   static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    } ()

    var body: some View {
       
        Chart(data) { weather in
            
            LineMark(x: .value("", LineChart.formatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970)) as Date)), y: .value("", weather.tempCurrent)).foregroundStyle(.blue)
            PointMark(x: .value("", LineChart.formatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970)) as Date)), y: .value("", weather.tempCurrent)).foregroundStyle(.white)
                .symbolSize(15)
                .annotation {
                    Text(String(format: "%d", Int(weather.tempCurrent)))
                        .font(.caption)
                }
        }
    }
}

