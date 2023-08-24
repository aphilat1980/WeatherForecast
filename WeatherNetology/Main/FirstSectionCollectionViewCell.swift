//
//  FirstSectionCollectionViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 25.07.2023.
//

import UIKit

class FirstSectionCollectionViewCell: UICollectionViewCell {
    
    static let id = "FirstSectionCollectionViewCell_id"
    
    private lazy var backView: UIView = {
        var view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentTemperature: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 36)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentDescription: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentDate: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.965, green: 0.867, blue: 0.004, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.text = formatter.string(from: Date())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentMinMaxTemp: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var cloudnessIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "sunn")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "wind")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidityIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "humidity")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentHumidity: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentWindSpeed: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentCloudness: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentSunrise: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentSunset: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var stackView: UIView = {
        let view = UIView ()
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.addSubview(cloudnessIcon)
        cloudnessIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cloudnessIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view.addSubview(currentCloudness)
        currentCloudness.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        currentCloudness.leadingAnchor.constraint(equalTo: cloudnessIcon.trailingAnchor).isActive = true
        view.addSubview(windIcon)
        windIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        windIcon.leadingAnchor.constraint(equalTo: currentCloudness.trailingAnchor, constant: 5).isActive = true
        view.addSubview(currentWindSpeed)
        currentWindSpeed.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        currentWindSpeed.leadingAnchor.constraint(equalTo: windIcon.trailingAnchor).isActive = true
        view.addSubview(humidityIcon)
        humidityIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        humidityIcon.leadingAnchor.constraint(equalTo: currentWindSpeed.trailingAnchor, constant: 5).isActive = true
        view.addSubview(currentHumidity)
        currentHumidity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        currentHumidity.leadingAnchor.constraint(equalTo: humidityIcon.trailingAnchor, constant: 2).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, E, d MMMM"
        return formatter
    } ()
    
    private lazy var elipseImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "elipse")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var daytimeImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "daytime")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunsetImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "sunset")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(backView)
        backView.addSubview(currentTemperature)
        backView.addSubview(currentDescription)
        backView.addSubview(elipseImage)
        backView.addSubview(daytimeImage)
        backView.addSubview(sunsetImage)
        backView.addSubview(currentDate)
        backView.addSubview(currentMinMaxTemp)
        backView.addSubview(stackView)
        backView.addSubview(currentSunrise)
        backView.addSubview(currentSunset)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        backView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        
        currentTemperature.translatesAutoresizingMaskIntoConstraints = false
        currentTemperature.heightAnchor.constraint(equalToConstant: 40).isActive = true
        currentTemperature.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentTemperature.topAnchor.constraint(equalTo: backView.topAnchor, constant: 58).isActive = true
        
        currentDescription.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentDescription.topAnchor.constraint(equalTo: currentTemperature.bottomAnchor, constant: 5).isActive = true
        
        currentDate.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentDate.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -21).isActive = true
        
        currentMinMaxTemp.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentMinMaxTemp.topAnchor.constraint(equalTo: elipseImage.topAnchor, constant: 16).isActive = true
        
        stackView.widthAnchor.constraint(equalToConstant: 188).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: currentDescription.bottomAnchor, constant: 8).isActive = true
        
        elipseImage.widthAnchor.constraint(equalToConstant: 280).isActive = true
        elipseImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        elipseImage.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        elipseImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 17).isActive = true
        
        daytimeImage.centerXAnchor.constraint(equalTo: elipseImage.leadingAnchor).isActive = true
        daytimeImage.topAnchor.constraint(equalTo: elipseImage.bottomAnchor, constant: 2).isActive = true
        
        sunsetImage.centerXAnchor.constraint(equalTo: elipseImage.trailingAnchor).isActive = true
        sunsetImage.topAnchor.constraint(equalTo: elipseImage.bottomAnchor, constant: 2).isActive = true
        
        currentSunrise.centerXAnchor.constraint(equalTo: daytimeImage.centerXAnchor).isActive = true
        currentSunrise.topAnchor.constraint(equalTo: daytimeImage.bottomAnchor, constant: 5).isActive = true
        
        currentSunset.centerXAnchor.constraint(equalTo: sunsetImage.centerXAnchor).isActive = true
        currentSunset.topAnchor.constraint(equalTo: sunsetImage.bottomAnchor, constant: 5).isActive = true
    }
    
    public func configure (with city: City) {
        
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.currentTemperature.text = "\(Int(DataManager.shared.currentWeather[0].currentTemperature))°"
            self.currentMinMaxTemp.text = "\(Int(DataManager.shared.currentWeather[0].currentMinTemp))°/\(Int(DataManager.shared.currentWeather[0].currentMaxTemp))°"
        } else {
            self.currentTemperature.text = "\(Int(DataManager.shared.currentWeather[0].currentTemperature)*9/5+32)°F"
            self.currentMinMaxTemp.text = "\(Int(DataManager.shared.currentWeather[0].currentMinTemp)*9/5+32)°F/\(Int(DataManager.shared.currentWeather[0].currentMaxTemp)*9/5+32)°F"
        }
        self.currentDescription.text = DataManager.shared.currentWeather[0].currentDescription
        self.currentHumidity.text = "\(DataManager.shared.currentWeather[0].currentHumidity)%"
        
        if UserDefaults.standard.string(forKey: "windspeed") == "M" {
            self.currentWindSpeed.text = " \(Int(DataManager.shared.currentWeather[0].currentWindSpeed)) m/s"
        } else {
            self.currentWindSpeed.text = String(format: "%.1f km/h", DataManager.shared.currentWeather[0].currentWindSpeed*3.6)
        }
        
        self.currentCloudness.text = " \(Int(DataManager.shared.currentWeather[0].currentCloudness))%"
        let formatterDate = DateFormatter()
        formatterDate.dateFormat = "HH:mm"
        let dateSunrise = NSDate(timeIntervalSince1970: TimeInterval(DataManager.shared.currentWeather[0].currentSunrise))
        self.currentSunrise.text = formatterDate.string(from: dateSunrise as Date)
        let dateSunset = NSDate(timeIntervalSince1970: TimeInterval(DataManager.shared.currentWeather[0].currentSunset))
        self.currentSunset.text = formatterDate.string(from: dateSunset as Date)
        
    }
}
