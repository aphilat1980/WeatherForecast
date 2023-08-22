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
        //view.frame = CGRect(x: 0, y: 0, width: 344, height: 56)
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var weatherDate: UILabel = {
        var view = UILabel()
        
        view.frame = CGRect(x: 0, y: 0, width: 53, height: 19)
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        
        view.attributedText = NSMutableAttributedString(string: "17/04", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherDescription: UILabel = {
        var view = UILabel()
        //view.frame = CGRect(x: 0, y: 0, width: 206, height: 19)
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        //view.lineBreakMode = .byTruncatingMiddle
        //view.numberOfLines = 1
        view.attributedText = NSMutableAttributedString(string: "Преимущес...облачно", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    private lazy var weatherMinMaxTemp: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 43, height: 21.83)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        // Line height: 23 pt
        view.attributedText = NSMutableAttributedString(string: "4 -11", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var weatherCloudness: UILabel = {
        var view = UILabel()
        
        view.frame = CGRect(x: 0, y: 0, width: 23, height: 15.19)
        view.textColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 12)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        // Line height: 16 pt
        // (identical to box height)
        view.attributedText = NSMutableAttributedString(string: "57%", attributes: [NSAttributedString.Key.kern: -0.12, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var greaterIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 6, height: 9)
        view.image = UIImage(named: "greater")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var weatherIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 15, height: 17)
        //view.image = UIImage(named: "greater")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //contentView.addSubview(collectionView)
        
        //collectionView.delegate = self
        //collectionView.dataSource = self
        
        //DataManager.shared.completionForThirdSection = {
           //print ("colview3 upgraded")
            //self.collectionView.reloadData()
        //}
        
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        
        //backView.addSubview(currentTemperature)
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
        /*NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])*/
        
        backView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
         
         backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
         
         //currentTemperature.widthAnchor.constraint(equalToConstant: 45).isActive = true
         /*currentTemperature.heightAnchor.constraint(equalToConstant: 40).isActive = true
         currentTemperature.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 163).isActive = true
         currentTemperature.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5).isActive = true*/
        
        weatherDate.topAnchor.constraint(equalTo: backView.topAnchor, constant: 6).isActive = true
        weatherDate.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        
        weatherDescription.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        weatherDescription.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 66).isActive = true
        weatherDescription.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -72).isActive = true
        
        
        
        //weatherMinMaxTemp.widthAnchor.constraint(equalToConstant: 43).isActive = true
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
        //self.currentTemperature.text = "\(Int(weather.tempCurrent))"
        //self.date.text = weather.date
        let date = NSDate(timeIntervalSince1970: TimeInterval(weather.dateSince1970))
        self.weatherDate.text = formatter.string(from: date as Date)
        self.weatherDescription.text = weather.dayCondition
        if UserDefaults.standard.string(forKey: "temperature") == "C" {
            self.weatherMinMaxTemp.text = "\(Int(weather.dayTempMin))°-\(Int(weather.dayTempMax))°"
        } else {
            self.weatherMinMaxTemp.text = "\(Int(weather.dayTempMin)*9/5+32)°-\(Int(weather.dayTempMax)*9/5+32)°F"
        }
        //self.weatherMinMaxTemp.text = "\(Int(weather.dayTempMin))°-\(Int(weather.dayTempMax))°"
        self.weatherCloudness.text = "\(Int(weather.dayCloudness*100))%"
        self.weatherIcon.image = UIImage(named: weather.dayIcon!)
        print(weather.dayIcon)
        //print (weather.nightIcon)
        //print(weather.dayPrecProb)
    }
    

    

}


/*extension UIImageView {
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
}*/


/*extension ThirdSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.shared.weathers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:ThirdSectionCollectionViewCell.id, for: indexPath) as! ThirdSectionCollectionViewCell
        cell.configure(with: DataManager.shared.weathers[indexPath.row])
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DataManager.shared.fetchWeather(city: DataManager.shared.cities[indexPath.row])
    }*/
}
extension ThirdSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           //let width = itemWidth()
           return CGSize(width: 360, height: 60)
       
   }
       
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    }

}*/
