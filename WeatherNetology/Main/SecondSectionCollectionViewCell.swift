//
//  SecondSectionCollectionViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 25.07.2023.
//

import UIKit

class SecondSectionCollectionViewCell: UICollectionViewCell {
    
    static let id = "SecondSectionCollectionViewCell_id"
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    } ()
    
    var temperature: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        return label
    }()
    
    var date: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        return label
    }()
    
    var backView: UIView = {
        let view = UIView ()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 0.3
        view.layer.borderColor = CGColor (red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var weatherIcon: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        backView.addSubview(temperature)
        backView.addSubview(date)
        backView.addSubview(weatherIcon)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
            
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            temperature.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            temperature.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            date.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            date.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            weatherIcon.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            weatherIcon.topAnchor.constraint(equalTo: date.bottomAnchor, constant: -6),
            weatherIcon.heightAnchor.constraint(equalToConstant: 35),
            weatherIcon.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    public func configure (with weather: Weather) {
        
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.temperature.text = "\(Int(weather.tempCurrent))°"
        } else {
            self.temperature.text = "\(Int(weather.tempCurrent)*9/5+32)°F"
        }
        let date = NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970))
        self.date.text = formatter.string(from: date as Date)
        weatherIcon.load(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weatherIcon!).png")!)
        }
    }

//расширение для UIImageView для загрузки картинок по url, при этом способа аналогично загрузить иконки погоды с api yandex c расширением svg - не нашел!! Пришлось добавлять их в assets. Иконки с расширениенм png с openweather загружаются нормально
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
