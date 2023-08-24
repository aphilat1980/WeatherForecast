//
//  DailySecondSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 15.08.2023.
//

import UIKit

class DailySecondSectionTableViewCell: UITableViewCell {

    static let id = "DailySecondSectionTableViewCell_id"
    
    private lazy var backDayView: UIView = {
        var view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backNightView: UIView = {
        var view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   private lazy var dayLabel: UILabel = {
        var view = UILabel()
        view.text = "День"
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayAverageTemperature: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayDescription: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayWeatherIcon: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayFeelsLikeIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "feelsLike")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayFeelsLikeLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "По ощущениям"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayFeelsLikeTemperature: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayWindIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "windDark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayWindLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Ветер"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayWind: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayRainIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "rain")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayRainLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Дождь"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayRain: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayCloudnessIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "clouds")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayCloudnessLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Облачность"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayCloudness: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightLabel: UILabel = {
        var view = UILabel()
        view.text = "Ночь"
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightAverageTemperature: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightDescription: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var nightWeatherIcon: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightFeelsLikeIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "feelsLike")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightFeelsLikeLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "По ощущениям"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightFeelsLikeTemperature: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightWindIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "windDark")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightWindLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Ветер"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightWind: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightRainIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "rain")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightRainLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Дождь"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightRain: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightCloudnessIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "clouds")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightCloudnessLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Облачность"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nightCloudness: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunAndMoonLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        view.text = "Солнце и луна"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var moonText: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fullMoonIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "fullMoon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "sun")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunRiseBeginLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Восход"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunRiseBegin: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunRiseEndLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Заход"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunRiseEnd: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var moonIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "moon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunSetBeginLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Восход"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunSetBegin: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunSetEndLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Заход"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunSetEnd: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(backDayView)
        contentView.addSubview(backNightView)
        backDayView.addSubview(dayLabel)
        backDayView.addSubview(dayWeatherIcon)
        backDayView.addSubview(dayAverageTemperature)
        backDayView.addSubview(dayDescription)
        backDayView.addSubview(dayFeelsLikeIcon)
        backDayView.addSubview(dayFeelsLikeLabel)
        backDayView.addSubview(dayFeelsLikeTemperature)
        backDayView.addSubview(dayWindIcon)
        backDayView.addSubview(dayWindLabel)
        backDayView.addSubview(dayWind)
        backDayView.addSubview(dayRainIcon)
        backDayView.addSubview(dayRainLabel)
        backDayView.addSubview(dayRain)
        backDayView.addSubview(dayCloudnessIcon)
        backDayView.addSubview(dayCloudnessLabel)
        backDayView.addSubview(dayCloudness)
        
        backNightView.addSubview(nightLabel)
        backNightView.addSubview(nightWeatherIcon)
        backNightView.addSubview(nightAverageTemperature)
        backNightView.addSubview(nightDescription)
        backNightView.addSubview(nightFeelsLikeIcon)
        backNightView.addSubview(nightFeelsLikeLabel)
        backNightView.addSubview(nightFeelsLikeTemperature)
        backNightView.addSubview(nightWindIcon)
        backNightView.addSubview(nightWindLabel)
        backNightView.addSubview(nightWind)
        backNightView.addSubview(nightRainIcon)
        backNightView.addSubview(nightRainLabel)
        backNightView.addSubview(nightRain)
        backNightView.addSubview(nightCloudnessIcon)
        backNightView.addSubview(nightCloudnessLabel)
        backNightView.addSubview(nightCloudness)
        
        contentView.addSubview(sunAndMoonLabel)
        contentView.addSubview(moonText)
        contentView.addSubview(fullMoonIcon)
        contentView.addSubview(sunIcon)
        contentView.addSubview(sunRiseBeginLabel)
        contentView.addSubview(sunRiseBegin)
        contentView.addSubview(sunRiseEndLabel)
        contentView.addSubview(sunRiseEnd)
        contentView.addSubview(moonIcon)
        contentView.addSubview(sunSetBeginLabel)
        contentView.addSubview(sunSetBegin)
        contentView.addSubview(sunSetEndLabel)
        contentView.addSubview(sunSetEnd)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        
        backDayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backDayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        backDayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        backDayView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        backNightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backNightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        backNightView.topAnchor.constraint(equalTo: backDayView.bottomAnchor, constant: 15).isActive = true
        backNightView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        dayLabel.leadingAnchor.constraint(equalTo: backDayView.leadingAnchor, constant: 15).isActive = true
        dayLabel.topAnchor.constraint(equalTo: backDayView.topAnchor, constant: 20).isActive = true
        
        dayWeatherIcon.trailingAnchor.constraint(equalTo: backDayView.centerXAnchor).isActive = true
        dayWeatherIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        dayWeatherIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        dayWeatherIcon.topAnchor.constraint(equalTo: backDayView.topAnchor, constant: 20).isActive = true
        
        dayAverageTemperature.leadingAnchor.constraint(equalTo: dayWeatherIcon.trailingAnchor, constant: 10).isActive = true
        dayAverageTemperature.centerYAnchor.constraint(equalTo: dayWeatherIcon.centerYAnchor).isActive = true
        
        dayDescription.topAnchor.constraint(equalTo: dayAverageTemperature.bottomAnchor, constant: 10).isActive = true
        dayDescription.centerXAnchor.constraint(equalTo: backDayView.centerXAnchor).isActive = true
        
        dayFeelsLikeIcon.topAnchor.constraint(equalTo: backDayView.topAnchor, constant: 110).isActive = true
        dayFeelsLikeIcon.leadingAnchor.constraint(equalTo: backDayView.leadingAnchor, constant: 15).isActive = true
        dayFeelsLikeIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dayFeelsLikeIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        dayFeelsLikeLabel.centerYAnchor.constraint(equalTo: dayFeelsLikeIcon.centerYAnchor).isActive = true
        dayFeelsLikeLabel.leadingAnchor.constraint(equalTo: dayFeelsLikeIcon.trailingAnchor, constant: 15).isActive = true
        
        dayFeelsLikeTemperature.centerYAnchor.constraint(equalTo: dayFeelsLikeIcon.centerYAnchor).isActive = true
        dayFeelsLikeTemperature.trailingAnchor.constraint(equalTo: backDayView.trailingAnchor, constant: -15).isActive = true
        
        dayWindIcon.topAnchor.constraint(equalTo: dayFeelsLikeIcon.bottomAnchor, constant: 26).isActive = true
        dayWindIcon.leadingAnchor.constraint(equalTo: dayFeelsLikeIcon.leadingAnchor).isActive = true
        dayWindIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        dayWindIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        dayWindLabel.centerYAnchor.constraint(equalTo: dayWindIcon.centerYAnchor).isActive = true
        dayWindLabel.leadingAnchor.constraint(equalTo: dayWindIcon.trailingAnchor, constant: 15).isActive = true
        
        dayWind.centerYAnchor.constraint(equalTo: dayWindIcon.centerYAnchor).isActive = true
        dayWind.trailingAnchor.constraint(equalTo: backDayView.trailingAnchor, constant: -15).isActive = true
        
        dayRainIcon.topAnchor.constraint(equalTo: dayWindIcon.bottomAnchor, constant: 26).isActive = true
        dayRainIcon.leadingAnchor.constraint(equalTo: dayFeelsLikeIcon.leadingAnchor).isActive = true
        dayRainIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dayRainIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        dayRainLabel.centerYAnchor.constraint(equalTo: dayRainIcon.centerYAnchor).isActive = true
        dayRainLabel.leadingAnchor.constraint(equalTo: dayRainIcon.trailingAnchor, constant: 15).isActive = true
        
        dayRain.centerYAnchor.constraint(equalTo: dayRainIcon.centerYAnchor).isActive = true
        dayRain.trailingAnchor.constraint(equalTo: backDayView.trailingAnchor, constant: -15).isActive = true
        
        dayCloudnessIcon.topAnchor.constraint(equalTo: dayRainIcon.bottomAnchor, constant: 26).isActive = true
        dayCloudnessIcon.leadingAnchor.constraint(equalTo: dayFeelsLikeIcon.leadingAnchor).isActive = true
        dayCloudnessIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dayCloudnessIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        dayCloudnessLabel.centerYAnchor.constraint(equalTo: dayCloudnessIcon.centerYAnchor).isActive = true
        dayCloudnessLabel.leadingAnchor.constraint(equalTo: dayCloudnessIcon.trailingAnchor, constant: 15).isActive = true
        
        dayCloudness.centerYAnchor.constraint(equalTo: dayCloudnessIcon.centerYAnchor).isActive = true
        dayCloudness.trailingAnchor.constraint(equalTo: backDayView.trailingAnchor, constant: -15).isActive = true
        
        //CONFIGURE NIGHT BACK VIEW
        nightLabel.leadingAnchor.constraint(equalTo: backNightView.leadingAnchor, constant: 15).isActive = true
        nightLabel.topAnchor.constraint(equalTo: backNightView.topAnchor, constant: 20).isActive = true
        
        nightWeatherIcon.trailingAnchor.constraint(equalTo: backNightView.centerXAnchor).isActive = true
        nightWeatherIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        nightWeatherIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        nightWeatherIcon.topAnchor.constraint(equalTo: backNightView.topAnchor, constant: 20).isActive = true
        
        nightAverageTemperature.leadingAnchor.constraint(equalTo: nightWeatherIcon.trailingAnchor, constant: 10).isActive = true
        nightAverageTemperature.centerYAnchor.constraint(equalTo: nightWeatherIcon.centerYAnchor).isActive = true
        
        nightDescription.topAnchor.constraint(equalTo: nightAverageTemperature.bottomAnchor, constant: 10).isActive = true
        nightDescription.centerXAnchor.constraint(equalTo: backNightView.centerXAnchor).isActive = true
        
        nightFeelsLikeIcon.topAnchor.constraint(equalTo: backNightView.topAnchor, constant: 110).isActive = true
        nightFeelsLikeIcon.leadingAnchor.constraint(equalTo: backNightView.leadingAnchor, constant: 15).isActive = true
        nightFeelsLikeIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nightFeelsLikeIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        nightFeelsLikeLabel.centerYAnchor.constraint(equalTo: nightFeelsLikeIcon.centerYAnchor).isActive = true
        nightFeelsLikeLabel.leadingAnchor.constraint(equalTo: nightFeelsLikeIcon.trailingAnchor, constant: 15).isActive = true
        
        nightFeelsLikeTemperature.centerYAnchor.constraint(equalTo: nightFeelsLikeIcon.centerYAnchor).isActive = true
        nightFeelsLikeTemperature.trailingAnchor.constraint(equalTo: backNightView.trailingAnchor, constant: -15).isActive = true
        
        
        nightWindIcon.topAnchor.constraint(equalTo: nightFeelsLikeIcon.bottomAnchor, constant: 26).isActive = true
        nightWindIcon.leadingAnchor.constraint(equalTo: nightFeelsLikeIcon.leadingAnchor).isActive = true
        nightWindIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        nightWindIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        nightWindLabel.centerYAnchor.constraint(equalTo: nightWindIcon.centerYAnchor).isActive = true
        nightWindLabel.leadingAnchor.constraint(equalTo: nightWindIcon.trailingAnchor, constant: 15).isActive = true
        
        nightWind.centerYAnchor.constraint(equalTo: nightWindIcon.centerYAnchor).isActive = true
        nightWind.trailingAnchor.constraint(equalTo: backNightView.trailingAnchor, constant: -15).isActive = true
        
        nightRainIcon.topAnchor.constraint(equalTo: nightWindIcon.bottomAnchor, constant: 26).isActive = true
        nightRainIcon.leadingAnchor.constraint(equalTo: nightFeelsLikeIcon.leadingAnchor).isActive = true
        nightRainIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nightRainIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        nightRainLabel.centerYAnchor.constraint(equalTo: nightRainIcon.centerYAnchor).isActive = true
        nightRainLabel.leadingAnchor.constraint(equalTo: nightRainIcon.trailingAnchor, constant: 15).isActive = true
        
        nightRain.centerYAnchor.constraint(equalTo: nightRainIcon.centerYAnchor).isActive = true
        nightRain.trailingAnchor.constraint(equalTo: backNightView.trailingAnchor, constant: -15).isActive = true
        
        nightCloudnessIcon.topAnchor.constraint(equalTo: nightRainIcon.bottomAnchor, constant: 26).isActive = true
        nightCloudnessIcon.leadingAnchor.constraint(equalTo: nightFeelsLikeIcon.leadingAnchor).isActive = true
        nightCloudnessIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nightCloudnessIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        nightCloudnessLabel.centerYAnchor.constraint(equalTo: nightCloudnessIcon.centerYAnchor).isActive = true
        nightCloudnessLabel.leadingAnchor.constraint(equalTo: nightCloudnessIcon.trailingAnchor, constant: 15).isActive = true
        
        nightCloudness.centerYAnchor.constraint(equalTo: nightCloudnessIcon.centerYAnchor).isActive = true
        nightCloudness.trailingAnchor.constraint(equalTo: backNightView.trailingAnchor, constant: -15).isActive = true
        
        sunAndMoonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        sunAndMoonLabel.topAnchor.constraint(equalTo: backNightView.bottomAnchor, constant: 20).isActive = true
        
        moonText.centerYAnchor.constraint(equalTo: sunAndMoonLabel.centerYAnchor).isActive = true
        moonText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        fullMoonIcon.centerYAnchor.constraint(equalTo: sunAndMoonLabel.centerYAnchor).isActive = true
        fullMoonIcon.trailingAnchor.constraint(equalTo: moonText.leadingAnchor, constant: -5).isActive = true
        
        sunIcon.topAnchor.constraint(equalTo: sunAndMoonLabel.bottomAnchor, constant: 17).isActive = true
        sunIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        sunRiseBeginLabel.topAnchor.constraint(equalTo: sunIcon.bottomAnchor, constant: 15).isActive = true
        sunRiseBeginLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        sunRiseEndLabel.topAnchor.constraint(equalTo: sunRiseBeginLabel.bottomAnchor, constant: 15).isActive = true
        sunRiseEndLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        sunRiseBegin.centerYAnchor.constraint(equalTo: sunRiseBeginLabel.centerYAnchor).isActive = true
        sunRiseBegin.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15).isActive = true
        sunRiseEnd.centerYAnchor.constraint(equalTo: sunRiseEndLabel.centerYAnchor).isActive = true
        sunRiseEnd.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15).isActive = true
        
        moonIcon.centerYAnchor.constraint(equalTo: sunIcon.centerYAnchor).isActive = true
        moonIcon.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 25).isActive = true
        sunSetBeginLabel.centerYAnchor.constraint(equalTo: sunRiseBeginLabel.centerYAnchor).isActive = true
        sunSetBeginLabel.leadingAnchor.constraint(equalTo: moonIcon.leadingAnchor).isActive = true
        sunSetEndLabel.topAnchor.constraint(equalTo: sunSetBeginLabel.bottomAnchor, constant: 15).isActive = true
        sunSetEndLabel.leadingAnchor.constraint(equalTo: sunSetBeginLabel.leadingAnchor).isActive = true
        sunSetBegin.centerYAnchor.constraint(equalTo: sunSetBeginLabel.centerYAnchor).isActive = true
        sunSetBegin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        sunSetEnd.centerYAnchor.constraint(equalTo: sunSetEndLabel.centerYAnchor).isActive = true
        sunSetEnd.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    public func configure (with dailyWeather: DailyWeather) {
        
        dayWeatherIcon.image = UIImage(named: dailyWeather.dayIcon!)
        dayDescription.text = dailyWeather.dayCondition
        dayRain.text = "\(Int(dailyWeather.dayPrecStrengh*100))%"
        dayCloudness.text = "\(Int(dailyWeather.dayCloudness*100))%"
        nightWeatherIcon.image = UIImage(named: dailyWeather.nightIcon!)
        nightDescription.text = dailyWeather.nightCondition
        nightRain.text = "\(Int(dailyWeather.nightPrecStrengh*100))%"
        nightCloudness.text = "\(Int(dailyWeather.nightCloudness*100))%"
        moonText.text = dailyWeather.moonText
        sunRiseBegin.text = dailyWeather.rise_begin
        sunRiseEnd.text = dailyWeather.sunrise
        sunSetBegin.text = dailyWeather.sunset
        sunSetEnd.text = dailyWeather.set_end
        
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            dayAverageTemperature.text = "\(Int(dailyWeather.dayTempAvg))°"
            nightAverageTemperature.text = "\(Int(dailyWeather.nightTempAvg))°"
            dayFeelsLikeTemperature.text = "\(Int(dailyWeather.dayFeelsLikeTemp))°"
            nightFeelsLikeTemperature.text = "\(Int(dailyWeather.nightFeelsLikeTemp))°"
        } else {
            dayAverageTemperature.text = "\(Int(dailyWeather.dayTempAvg)*9/5+32)°F"
            nightAverageTemperature.text = "\(Int(dailyWeather.nightTempAvg)*9/5+32)°F"
            dayFeelsLikeTemperature.text = "\(Int(dailyWeather.dayFeelsLikeTemp)*9/5+32)°F"
            nightFeelsLikeTemperature.text = "\(Int(dailyWeather.nightFeelsLikeTemp)*9/5+32)°F"
        }
        if UserDefaults.standard.string(forKey: "windspeed") == "M" {
            dayWind.text = "\(dailyWeather.dayWindSpeed)m/s \(dailyWeather.dayWindDir!)"
            nightWind.text = "\(dailyWeather.nightWindSpeed)m/s \(dailyWeather.nightWindDir!)"
        } else {
            dayWind.text = String(format: "%.1f km/h \(dailyWeather.dayWindDir!)", dailyWeather.dayWindSpeed*3.6)
            nightWind.text = String(format: "%.1f km/h \(dailyWeather.nightWindDir!)", dailyWeather.nightWindSpeed*3.6)
        }
    }
}
