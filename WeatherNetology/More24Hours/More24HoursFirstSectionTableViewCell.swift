//
//  More24HoursFirstSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 14.08.2023.
//

import UIKit
import SwiftUI

class More24HoursFirstSectionTableViewCell: UITableViewCell {
    
    static let id = "More24HoursFirstSectionTableViewCell_id"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let controller = UIHostingController(rootView: LineChart())
        guard let chart = controller.view else {return}
        chart.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chart)
        NSLayoutConstraint.activate([
            chart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            chart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            chart.topAnchor.constraint(equalTo: contentView.topAnchor),
            chart.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


