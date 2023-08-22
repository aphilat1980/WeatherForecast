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
        //view.frame = CGRect(x: 0, y: 0, width: 344, height: 212)
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentTemperature: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 45, height: 40)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //view.font = UIFont.systemFont(ofSize: 36.0)
        view.font = UIFont(name: "Rubik-Medium", size: 36)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.94
        view.attributedText = NSMutableAttributedString(string: "13", attributes: [NSAttributedString.Key.kern: 3.06, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentDescription: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 227, height: 20)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Возможен небольшой дождь", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentDate: UILabel = {
        var view = UILabel()
        //view.frame = CGRect(x: 0, y: 0, width: 227, height: 20)
        view.textColor = UIColor(red: 0.965, green: 0.867, blue: 0.004, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Возможен небольшой дождь", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.text = formatter.string(from: Date())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentMinMaxTemp: UILabel = {
        
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 44, height: 20)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "7 /13", attributes: [NSAttributedString.Key.kern: 0.32, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var sunnIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 21, height: 14)
        view.image = UIImage(named: "sunn")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 16)
        view.image = UIImage(named: "wind")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var humidityIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 13, height: 15)
        view.image = UIImage(named: "humidity")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var currentHumidity: UILabel = {
        
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 27, height: 18)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        view.attributedText = NSMutableAttributedString(string: "75%", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private lazy var stackView: UIView = {
        let view = UIView ()
        
        view.frame = CGRect(x: 0, y: 0, width: 188, height: 30)
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        //view.backgroundColor = .red
        view.addSubview(sunnIcon)
        sunnIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        sunnIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(windIcon)
        windIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        windIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53).isActive = true
        view.addSubview(humidityIcon)
        humidityIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        humidityIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 138).isActive = true
        
        view.addSubview(currentHumidity)
        currentHumidity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        currentHumidity.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
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
        //view.frame = CGRect(x: 0, y: 0, width: 280, height: 200)
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
        //contentView.backgroundColor = .orange
        contentView.addSubview(backView)
        backView.addSubview(currentTemperature)
        backView.addSubview(currentDescription)
        backView.addSubview(elipseImage)
        backView.addSubview(daytimeImage)
        backView.addSubview(sunsetImage)
        backView.addSubview(currentDate)
        backView.addSubview(currentMinMaxTemp)
        backView.addSubview(stackView)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
            
        backView.translatesAutoresizingMaskIntoConstraints = false
        //backView.widthAnchor.constraint(equalToConstant: 344).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        
        
        currentTemperature.translatesAutoresizingMaskIntoConstraints = false
        //currentTemperature.widthAnchor.constraint(equalToConstant: 45).isActive = true
        currentTemperature.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //currentTemperature.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 147).isActive = true
        currentTemperature.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentTemperature.topAnchor.constraint(equalTo: backView.topAnchor, constant: 58).isActive = true
        
        //currentDescription.widthAnchor.constraint(equalToConstant: 227).isActive = true
        //currentDescription.heightAnchor.constraint(equalToConstant: 20).isActive = true
        currentDescription.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentDescription.topAnchor.constraint(equalTo: currentTemperature.bottomAnchor, constant: 5).isActive = true
        
        
        //currentDate.widthAnchor.constraint(equalToConstant: 151).isActive = true
        //currentDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        currentDate.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        currentDate.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -21).isActive = true
        
        
        
        
        //currentMinMaxTemp.widthAnchor.constraint(equalToConstant: 44).isActive = true
        //currentMinMaxTemp.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
        
        
        //daytimeImage.widthAnchor.constraint(equalToConstant: 280).isActive = true
        //daytimeImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        daytimeImage.centerXAnchor.constraint(equalTo: elipseImage.leadingAnchor).isActive = true
        daytimeImage.topAnchor.constraint(equalTo: elipseImage.bottomAnchor, constant: 2).isActive = true
        
        
        sunsetImage.centerXAnchor.constraint(equalTo: elipseImage.trailingAnchor).isActive = true
        sunsetImage.topAnchor.constraint(equalTo: elipseImage.bottomAnchor, constant: 2).isActive = true
        
        
        
        
    
        
    }
    
    public func configure (with city: City) {
        
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.currentTemperature.text = "\(Int(city.currentTemp))°"
            self.currentMinMaxTemp.text = "\(Int(city.currentMinTemp))°/\(Int(city.currentMaxTemp))°"
        } else {
            self.currentTemperature.text = "\(Int(city.currentTemp)*9/5+32)°F"
            self.currentMinMaxTemp.text = "\(Int(city.currentMinTemp)*9/5+32)°F/\(Int(city.currentMaxTemp)*9/5+32)°F"
        }
        self.currentDescription.text = city.currentDescription
        self.currentHumidity.text = "\(city.currentHumidity)%"
        //let date = NSDate(timeIntervalSince1970: TimeInterval(city.))
        //self.date.text = formatter.string(from: date as Date)
        
        //self.date.text = weather.date
    }
    
    
    
    
}
