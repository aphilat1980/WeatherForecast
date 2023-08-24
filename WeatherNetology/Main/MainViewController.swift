//
//  MainViewController.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 24.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var currentCity: City?

    var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SecondSectionTableViewCell.self, forCellReuseIdentifier: SecondSectionTableViewCell.id)
        tableView.register(FirstSectionTableViewCell.self, forCellReuseIdentifier: FirstSectionTableViewCell.id)
        tableView.register(ThirdSectionTableViewCell.self, forCellReuseIdentifier: ThirdSectionTableViewCell.id)
        tableView.separatorColor = .white
        return tableView
    }()
    
    private lazy var addCityImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "plus.circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addNewCity(_:)))
        image.addGestureRecognizer(guestureRecognizer)
        return image
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //alert в случае ошибки загрузки города
        DataManager.shared.networkManager.alertCompletion = {
            DispatchQueue.main.async {
                let alert = UIAlertController (title: "Сбой загрузки", message: "Попробуйте снова", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
        //проверка наличия загруженных данных
        if DataManager.shared.cities.count == 0 {
            setupViewNoCity()
        } else {
            setupViewCityExist()
        }
    }
    
    func setupViewCityExist() {
        
        currentCity = DataManager.shared.cities[0]
        navigationController?.isNavigationBarHidden = false
        title = currentCity!.name
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "locationIcon"), style: .done, target: self, action: #selector(addNewCity(_:)))]
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "settingsIcon"), style: .done, target: self, action: #selector(settingsView(_:))), UIBarButtonItem(image: UIImage(systemName: "delete.left"), style: .done, target: self, action: #selector(deleteAllData(_:))) ]
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
        
        DataManager.shared.fetchCurrentWeather(city: currentCity!)
        DataManager.shared.fetchWeather(city: currentCity!)
        DataManager.shared.fetchDailyWeather(city: currentCity!)
        DataManager.shared.completionForThirdSection = {
            self.tableView.reloadSections(IndexSet(integer: 2), with: .none)
        }
        //проверка на необходимость обновления данных о погоде
        checkWeather()
    }
    
    func setupViewNoCity () {
        
        view.addSubview(addCityImage)
        view.backgroundColor = .white
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            addCityImage.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            addCityImage.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            addCityImage.heightAnchor.constraint(equalToConstant: 70),
            addCityImage.widthAnchor.constraint(equalToConstant: 70)
        ])
        navigationController?.isNavigationBarHidden = true
    }
    
    //функция загрузки данных о погоде
    @objc func addNewCity(_: Any) {
        
        let alert = UIAlertController (title: "Введите название города", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let action = UIAlertAction(title: "Ок", style: .default, handler: {_ in
            
            let newCityName = alert.textFields![0].text!
            DataManager.shared.loadWeather(city: newCityName) {cityLoaded in
                DataManager.shared.loadDailyWeather(city: cityLoaded!) {
                    DataManager.shared.fetchCities()
                    //если это первый город для отображения и не совпадает с текущим
                    if DataManager.shared.cities.count == 1, self.currentCity != cityLoaded {
                        self.currentCity = cityLoaded
                        self.title = cityLoaded!.name
                        self.setupViewCityExist()
                    }
                    //если город не первый, но совпадает с текущим
                    if self.currentCity == cityLoaded {
                        DataManager.shared.fetchWeather(city: cityLoaded!)
                        DataManager.shared.fetchDailyWeather(city: cityLoaded!)
                        DataManager.shared.fetchCurrentWeather(city: cityLoaded!)
                    }
                }
            }
        })
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //функция удаления данных из СoreData
    @objc func deleteAllData(_ sender: UIButton) {
        DataManager.shared.deleteAllData("City")
        DataManager.shared.deleteAllData("Weather")
        DataManager.shared.deleteAllData("DailyWeather")
        DataManager.shared.deleteAllData("CurrentWeather")
        
        for view in self.view.subviews{
            view.removeFromSuperview()
        }
        setupViewNoCity()
       
    }
    
    //функция перехода на экран настроек
    @objc func settingsView(_ sender: UIButton) {
        
        let settingsViewController = SettingsViewController()
        settingsViewController.completion = {
            self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            self.tableView.reloadSections(IndexSet(integer: 1), with: .none)
            self.tableView.reloadSections(IndexSet(integer: 2), with: .none)
        }
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    //функция проверки "актуальности" данных о погоде
    func checkWeather() {
        
        let deltaSeconds = Int64(Date().timeIntervalSince1970) - DataManager.shared.weathers[0].dateSince1970
        if deltaSeconds > 10800 {
            DataManager.shared.loadWeather(city: (currentCity?.name)!) {cityLoaded in
                DataManager.shared.loadDailyWeather(city: cityLoaded!) {
                    
                    DataManager.shared.fetchCities()
                    DataManager.shared.fetchWeather(city: cityLoaded!)
                    DataManager.shared.fetchDailyWeather(city: cityLoaded!)
                    DataManager.shared.fetchCurrentWeather(city: cityLoaded!)
                }
            }
        }
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1){
            return 1
        } else {
            return (DataManager.shared.dailyWeather.count)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        }
        else if indexPath.section == 1{
            return 155
        } else {
            return 65
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionTableViewCell.id, for: indexPath) as? FirstSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")}
            
            cell.completion = {city in
                self.currentCity = city
                self.title = self.currentCity?.name
                self.checkWeather()
            }
            
            cell.completion24Hours = {
                DataManager.shared.fetchWeather(city: self.currentCity!)
                let  more24HoursViewController = More24HoursViewController()
                self.navigationController?.pushViewController(more24HoursViewController, animated: true)
            }
            return cell
            
            
        } else if (indexPath.section == 1){
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionTableViewCell.id, for: indexPath) as? SecondSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")}
            
            cell.completion24Hours = {
                DataManager.shared.fetchWeather(city: self.currentCity!)
                let  more24HoursViewController = More24HoursViewController()
                self.navigationController?.pushViewController(more24HoursViewController, animated: true)
            }
            
            cell.completion24Days = {
                let alert = UIAlertController (title: "Уведомление", message: "К сожалению я не смог найти API с прогнозом более, чем на 7 дней. Функционал прогноза на 24 дня недоступен", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default, handler:nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdSectionTableViewCell.id, for: indexPath) as? ThirdSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")}
            cell.configure(with: DataManager.shared.dailyWeather[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 2) {
            
            let  dailyViewController = DailyViewController(dailyWeather: DataManager.shared.dailyWeather[indexPath.row])
            self.navigationController?.pushViewController(dailyViewController, animated: true)
            }
    }
    
    
}

