//
//  OnboardingViewController.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 19.07.2023.
//

import UIKit
import CoreLocation

class OnboardingViewController: UIViewController {
    
    //let networkManager = NetworkManager()
    //let dataManager = DataManager()
    
    let locationManager = CLLocationManager()
    

    private lazy var backView: UIScrollView = {
        var view = UIScrollView()
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        //view.layer.cornerRadius = 20
        //view.contentSize =
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        return contentView
    }()
    
    
    private lazy var onboardingIcon: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "onboarding")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var firstLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.973, green: 0.961, blue: 0.961, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 16)
        view.text = "Разрешить приложению  Weather использовать данные \nо местоположении вашего устройства"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 3
        view.textAlignment = .center
        return view
    }()
    
    private lazy var secondLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.text = "Чтобы получить более точные прогнозы погоды во время движения или путешествия Вы можете изменить свой выбор в любое время из меню приложения"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 4
        view.textAlignment = .center
        return view
    }()
    
    private lazy var buttonGeolocation: UIButton = {
        let view = UIButton ()
        view.layer.backgroundColor = UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 12)
        view.addTarget(self, action: #selector(didTapButton), for:.touchUpInside)
        view.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ УСТРОЙСТВА", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var myLocationLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.992, green: 0.986, blue: 0.963, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.text = "НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ"
        view.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        view.addGestureRecognizer(guestureRecognizer)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        backView.addSubview(contentView)
        
        contentView.addSubview(onboardingIcon)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(buttonGeolocation)
        contentView.addSubview(myLocationLabel)
    

        view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        
        setupConstraints()
        
        locationManager.requestWhenInUseAuthorization()
        
        DataManager.shared.networkManager.alertCompletion = {
            DispatchQueue.main.async {
                let alert = UIAlertController (title: "Сбой загрузки", message: "Попробуйте снова", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    
        
    }
    
   
    
    
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            backView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            backView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: backView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: backView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            //contentView.heightAnchor.constraint(equalTo: backView.heightAnchor),
            
            
            onboardingIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140),
            onboardingIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            onboardingIcon.widthAnchor.constraint(equalToConstant: 180),
            onboardingIcon.heightAnchor.constraint(equalToConstant: 196),
            
            firstLabel.topAnchor.constraint(equalTo: onboardingIcon.bottomAnchor, constant: 55),
            firstLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            firstLabel.widthAnchor.constraint(equalToConstant: 325),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 55),
            secondLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            secondLabel.widthAnchor.constraint(equalToConstant: 325),
            
            buttonGeolocation.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 44),
            buttonGeolocation.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonGeolocation.widthAnchor.constraint(equalToConstant: 340),
            buttonGeolocation.heightAnchor.constraint(equalToConstant: 40),
            
            myLocationLabel.topAnchor.constraint(equalTo: buttonGeolocation.bottomAnchor, constant: 25),
            //myLocationLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            myLocationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myLocationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
            
            
            
        ])
    }
    
    
    @objc private func didTapButton() {
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                self.locationManager.distanceFilter = 2000
                self.locationManager.startUpdatingLocation()
            }
        }
        
        
        
    }
    
    @objc func labelClicked(_ sender: Any) {
            
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
        
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
    

}

extension OnboardingViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location: CLLocation = manager.location else { return }
        self.locationManager.stopUpdatingLocation()
            fetchCityAndCountry(from: location) { city, country, error in
                guard let city = city, let country = country, error == nil else { return }
                
                print(city + ", " + country)
                
                DataManager.shared.loadWeather(city: city) {cityLoaded in
                    DataManager.shared.loadDailyWeather(city: cityLoaded!) {
                        
                        DataManager.shared.fetchCities()
                        DataManager.shared.fetchWeather(city: cityLoaded!)
                        DataManager.shared.fetchDailyWeather(city: cityLoaded!)
                        let mainViewController = MainViewController()
                        self.navigationController?.pushViewController(mainViewController, animated: true)
                        
                    }
                }
        }
    }

    
}


