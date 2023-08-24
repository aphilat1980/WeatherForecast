//
//  More24HoursSecondSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 14.08.2023.
//

import UIKit

class More24HoursSecondSectionTableViewCell: UITableViewCell {

    static let id = "More24HoursSecondSectionTableViewCell_id"
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd/MM"
        return formatter
    } ()
    
    private lazy var formatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    } ()
    
    private lazy var weatherDate: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherHours: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentTemperature: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var moonIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "moon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "windDark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var humidityIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "humidityDark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cloudsIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "clouds")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private lazy var descriptionLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.numberOfLines = 1
        view.lineBreakMode = .byTruncatingMiddle
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.numberOfLines = 2
        view.text = "Ветер"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidityLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Атмосферные осадки"
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var cloudsLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 128, height: 16)
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Облачность"
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var wind: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidity: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var clouds: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
        contentView.addSubview(weatherDate)
        contentView.addSubview(weatherHours)
        contentView.addSubview(currentTemperature)
        contentView.addSubview(moonIcon)
        contentView.addSubview(windIcon)
        contentView.addSubview(humidityIcon)
        contentView.addSubview(cloudsIcon)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(windLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(cloudsLabel)
        contentView.addSubview(wind)
        contentView.addSubview(humidity)
        contentView.addSubview(clouds)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupConstraints() {
        
        weatherDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        weatherDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        weatherHours.topAnchor.constraint(equalTo: weatherDate.bottomAnchor, constant: 5).isActive = true
        weatherHours.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        currentTemperature.topAnchor.constraint(equalTo: weatherHours.bottomAnchor, constant: 5).isActive = true
        currentTemperature.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        
        moonIcon.widthAnchor.constraint(equalToConstant: 12).isActive = true
        moonIcon.heightAnchor.constraint(equalToConstant: 12).isActive = true
        moonIcon.leadingAnchor.constraint(equalTo: weatherHours.trailingAnchor, constant: 11).isActive = true
        moonIcon.centerYAnchor.constraint(equalTo: weatherHours.centerYAnchor).isActive = true
        
        windIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        windIcon.heightAnchor.constraint(equalToConstant: 10).isActive = true
        windIcon.leadingAnchor.constraint(equalTo: moonIcon.leadingAnchor).isActive = true
        windIcon.topAnchor.constraint(equalTo: moonIcon.bottomAnchor, constant: 12).isActive = true
        
        
        humidityIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        humidityIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        humidityIcon.leadingAnchor.constraint(equalTo: moonIcon.leadingAnchor).isActive = true
        humidityIcon.topAnchor.constraint(equalTo: windIcon.bottomAnchor, constant: 10).isActive = true
        
        cloudsIcon.widthAnchor.constraint(equalToConstant: 14).isActive = true
        cloudsIcon.heightAnchor.constraint(equalToConstant: 10).isActive = true
        cloudsIcon.leadingAnchor.constraint(equalTo: moonIcon.leadingAnchor).isActive = true
        cloudsIcon.topAnchor.constraint(equalTo: humidityIcon.bottomAnchor, constant: 10).isActive = true
    
        descriptionLabel.centerYAnchor.constraint(equalTo: moonIcon.centerYAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: moonIcon.trailingAnchor, constant: 3).isActive = true
        
        windLabel.centerYAnchor.constraint(equalTo: windIcon.centerYAnchor).isActive = true
        windLabel.leadingAnchor.constraint(equalTo: windIcon.trailingAnchor, constant: 3).isActive = true
        
        humidityLabel.centerYAnchor.constraint(equalTo: humidityIcon.centerYAnchor).isActive = true
        humidityLabel.leadingAnchor.constraint(equalTo: humidityIcon.trailingAnchor, constant: 3).isActive = true
        
        cloudsLabel.centerYAnchor.constraint(equalTo: cloudsIcon.centerYAnchor).isActive = true
        cloudsLabel.leadingAnchor.constraint(equalTo: cloudsIcon.trailingAnchor, constant: 3).isActive = true
            
        wind.centerYAnchor.constraint(equalTo: windLabel.centerYAnchor).isActive = true
        wind.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        humidity.centerYAnchor.constraint(equalTo: humidityLabel.centerYAnchor).isActive = true
        humidity.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        clouds.centerYAnchor.constraint(equalTo: cloudsLabel.centerYAnchor).isActive = true
        clouds.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    
    public func configure (with weather: Weather) {
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970))
        self.weatherDate.text = formatter.string(from: date as Date)
        self.weatherHours.text = formatter2.string(from: date as Date)
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.currentTemperature.text = "\(Int(weather.tempCurrent))°"
            self.descriptionLabel.text = "\(weather.weatherDescription!). По ощущению \(Int(weather.tempFeelsLike))°"
        } else {
            self.currentTemperature.text = "\(Int(weather.tempCurrent)*9/5+32)°F"
            self.descriptionLabel.text = "\(weather.weatherDescription!). По ощущению \(Int(weather.tempFeelsLike)*9/5+32)°F"
        }
        if UserDefaults.standard.string(forKey: "windspeed") == "M" {
            self.wind.text = String(format: "%.1f m/s", weather.windSpeed)
        } else {
            self.wind.text = String(format: "%.1f km/h", weather.windSpeed*3.6)
        }
        self.humidity.text = "\(Int(weather.probPrecipitation*100))%"
        self.clouds.text = "\(weather.cloudness)%"
    }
}
