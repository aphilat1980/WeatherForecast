//
//  SettingsViewController.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 20.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var completion: (()->())?
    
    
    private lazy var backView: UIScrollView = {
        var view = UIScrollView()
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private lazy var cloud1Icon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "cloud1")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cloud2Icon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "cloud2")
        view.alpha = 0.33
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cloud3Icon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "cloud3")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var backSettingsView: UIView = {
        var view = UIView()
        
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var gradusSwitch: UISwitch = {
        var view = UISwitch()
        view.onTintColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        if UserDefaults.standard.string(forKey: "temperature")! == "F" {
            view.setOn(true, animated: true)
        }
        //view.setOn(true, animated: true)
        view.addTarget(self, action: #selector(switchTemperature(_: )), for: .valueChanged)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel ()
    
        label.textColor = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
        label.font = UIFont(name: "Rubik-Regular", size: 16)
        label.text = "Температура: On - F, Off - C"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel ()
        label.font = UIFont(name: "Rubik-Medium", size: 18)
        label.text = "Настройки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(backView)
        backView.addSubview(cloud1Icon)
        backView.addSubview(cloud2Icon)
        backView.addSubview(cloud3Icon)
        backView.addSubview(backSettingsView)
        backView.addSubview(gradusSwitch)
        backView.addSubview(settingsLabel)
        backView.addSubview(temperatureLabel)
        setupConstraints()
        print(UserDefaults.standard.string(forKey: "temperature"))
        
        view.backgroundColor = .white

        
    }
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            backView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            backView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            cloud1Icon.topAnchor.constraint(equalTo: backView.topAnchor, constant: 120),
            cloud1Icon.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            cloud1Icon.widthAnchor.constraint(equalToConstant: 182),
            cloud1Icon.heightAnchor.constraint(equalToConstant: 95),
            
            cloud2Icon.topAnchor.constraint(equalTo: backView.topAnchor, constant: 35),
            cloud2Icon.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            cloud2Icon.widthAnchor.constraint(equalToConstant: 245),
            cloud2Icon.heightAnchor.constraint(equalToConstant: 58),
            
            backSettingsView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            backSettingsView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            backSettingsView.widthAnchor.constraint(equalToConstant: 320),
            backSettingsView.heightAnchor.constraint(equalToConstant: 330),
            
            
            cloud3Icon.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -95),
            cloud3Icon.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            cloud3Icon.widthAnchor.constraint(equalToConstant: 216),
            cloud3Icon.heightAnchor.constraint(equalToConstant: 65),
            
            
            gradusSwitch.trailingAnchor.constraint(equalTo: backSettingsView.trailingAnchor, constant: -10),
            gradusSwitch.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            
            settingsLabel.leadingAnchor.constraint(equalTo: backSettingsView.leadingAnchor, constant: 20),
            settingsLabel.topAnchor.constraint(equalTo: backSettingsView.topAnchor, constant: 25),
            
            temperatureLabel.leadingAnchor.constraint(equalTo: backSettingsView.leadingAnchor, constant: 20),
            temperatureLabel.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 20),
            
            
            
            
        ])
        
    }
    
    @objc private func switchTemperature(_ sender:UISwitch) {
        
        if (sender.isOn == true) {
            UserDefaults.standard.set("F", forKey: "temperature")
        } else {
            UserDefaults.standard.set("C", forKey: "temperature")
        }
        completion?()
        print (UserDefaults.standard.string(forKey: "temperature"))
    }
    

}

