//
//  ThirdSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 27.07.2023.
//

import UIKit

class ThirdSectionTableViewCell: UITableViewCell {
    
    static let id = "ThirdSectionTableViewCell_id"
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    } ()
    
    private lazy var backView: UIView = {
        var view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherDate: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherDescription: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var weatherMinMaxTemp: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var weatherCloudness: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var greaterIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "greater")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var weatherIcon: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        backView.addSubview(weatherDate)
        backView.addSubview(weatherDescription)
        backView.addSubview(weatherMinMaxTemp)
        backView.addSubview(weatherCloudness)
        backView.addSubview(greaterIcon)
        backView.addSubview(weatherIcon)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        backView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        
        weatherDate.topAnchor.constraint(equalTo: backView.topAnchor, constant: 6).isActive = true
        weatherDate.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        
        weatherDescription.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        weatherDescription.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 66).isActive = true
        weatherDescription.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -72).isActive = true
        
        weatherMinMaxTemp.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -26).isActive = true
        weatherMinMaxTemp.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        
        weatherCloudness.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 30).isActive = true
        weatherCloudness.topAnchor.constraint(equalTo: weatherDate.bottomAnchor, constant: 6).isActive = true
        
        greaterIcon.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10).isActive = true
        greaterIcon.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        
        weatherIcon.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: weatherDate.bottomAnchor, constant: 5).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    
    public func configure (with weather: DailyWeather) {
    
        let date = NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970))
        self.weatherDate.text = formatter.string(from: date as Date)
        self.weatherDescription.text = weather.dayCondition
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.weatherMinMaxTemp.text = "\(Int(weather.dayTempMin))°-\(Int(weather.dayTempMax))°"
        } else {
            self.weatherMinMaxTemp.text = "\(Int(weather.dayTempMin)*9/5+32)°-\(Int(weather.dayTempMax)*9/5+32)°F"
        }
        self.weatherCloudness.text = "\(Int(weather.dayCloudness*100))%"
        self.weatherIcon.image = UIImage(named: weather.dayIcon!)
    }
}
