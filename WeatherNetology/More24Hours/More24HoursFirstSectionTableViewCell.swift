//
//  More24HoursFirstSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 14.08.2023.
//

import UIKit

class More24HoursFirstSectionTableViewCell: UITableViewCell {
    
    static let id = "More24HoursFirstSectionTableViewCell_id"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //dataManager.fetchCities()
        contentView.backgroundColor = .blue
        /*contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
        contentView.addSubview(forecastFor24Hours)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
        DataManager.shared.completionForFirstSection = {
            self.collectionView.reloadData()
            self.pageControl.numberOfPages = DataManager.shared.cities.count
        }*/
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}


