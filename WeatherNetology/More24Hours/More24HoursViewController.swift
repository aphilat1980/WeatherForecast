//
//  24HoursViewController.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 14.08.2023.
//

import UIKit

class More24HoursViewController: UIViewController {

    var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(More24HoursSecondSectionTableViewCell.self, forCellReuseIdentifier: More24HoursSecondSectionTableViewCell.id)
        tableView.register(More24HoursFirstSectionTableViewCell.self, forCellReuseIdentifier: More24HoursFirstSectionTableViewCell.id)
        //tableView.register(ThirdSectionTableViewCell.self, forCellReuseIdentifier: ThirdSectionTableViewCell.id)
        //tableView.separatorColor = .white
        
        
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setupConstraints()
        view.backgroundColor = .white
        navigationItem.backButtonTitle = "Прогноз на 24 часа"

        
    }
    

    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    

}

extension More24HoursViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
            return 8
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        } else {
            return 140
        }
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 2 {
            return "Ежедневный прогноз"
        }
        
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell()
        //var configuration = UIListContentConfiguration.cell()
        
        if (indexPath.section == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: More24HoursFirstSectionTableViewCell.id, for: indexPath) as? More24HoursFirstSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
                
            }
            return cell

        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: More24HoursSecondSectionTableViewCell.id, for: indexPath) as? More24HoursSecondSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            cell.configure(with: DataManager.shared.weathers[indexPath.row])
            return cell
            
            
        }
        
        //cell.contentConfiguration = configuration
        //return cell
        
    }
    
    
}


/*class MainViewController: UIViewController {
    
    //var firstSection:FirstSectionTableViewCell?
    
    
    //var dataManager = DataManager()
    
    var currentCity: City?

    var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(SecondSectionTableViewCell.self, forCellReuseIdentifier: SecondSectionTableViewCell.id)
        tableView.register(FirstSectionTableViewCell.self, forCellReuseIdentifier: FirstSectionTableViewCell.id)
        tableView.register(ThirdSectionTableViewCell.self, forCellReuseIdentifier: ThirdSectionTableViewCell.id)
        //tableView.separatorColor = .white
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        
        currentCity = DataManager.shared.cities[0]
        
        title = currentCity!.name
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "locationIcon"), style: .done, target: self, action: #selector(addNewCity(_:)))]
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "settingsIcon"), style: .done, target: self, action: #selector(deleteAllData(_:)))]
        
        //
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemGray4
        view.addSubview(tableView)
        setupConstraints()
        view.backgroundColor = .white
        //dataManager.loadWeather(city: dataManager.cities[0].name!)
        //dataManager.deleteAllData("City")
        //dataManager.deleteAllData("Weather")
        DataManager.shared.fetchWeather(city: currentCity!)
        print(DataManager.shared.cities.count)
        print(DataManager.shared.weathers.count)
        DataManager.shared.completionForThirdSection = {
            //print ("yaya")
            //self.tableView.reloadData()
            self.tableView.reloadSections(IndexSet(integer: 2), with: .none)
        }
        
    }
    
    
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    
    @objc func addNewCity(_ sender: UIButton) {
        
        
        let alert = UIAlertController (title: "Введите название города", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let action = UIAlertAction(title: "Ок", style: .default, handler: {_ in
            let newCityName = alert.textFields![0].text!
            DataManager.shared.loadWeather(city: newCityName) {cityLoaded in
                self.currentCity = cityLoaded
                DataManager.shared.fetchCities()
                DataManager.shared.fetchWeather(city: self.currentCity!)
                //self.title = self.currentCity!.name
                //self.tableView.reloadData()
            }
        })
        alert.addAction(action)
        self.present(alert, animated: true)
        
    }
    
    @objc func deleteAllData(_ sender: UIButton) {
        DataManager.shared.deleteAllData("City")
        DataManager.shared.deleteAllData("Weather")
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
            return (DataManager.shared.weathers.count)
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
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 2 {
            return "Ежедневный прогноз"
        }
        
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell()
        //var configuration = UIListContentConfiguration.cell()
        
        if (indexPath.section == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionTableViewCell.id, for: indexPath) as? FirstSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
                
            }
            cell.completion = {city in
                self.currentCity = city
                self.title = self.currentCity?.name
            }
            cell.completion24Hours = {
                let  more24HoursViewController = More24HoursViewController()
                self.navigationController?.pushViewController(more24HoursViewController, animated: true)
                print(self.currentCity!.name!)
            }
            return cell
            
            
        } else if (indexPath.section == 1){
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionTableViewCell.id, for: indexPath) as? SecondSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            return cell
            //configuration.text = "Погода на сутки по часам"
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdSectionTableViewCell.id, for: indexPath) as? ThirdSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            cell.configure(with: DataManager.shared.weathers[indexPath.row])
            return cell
            
            /*configuration.text = "\(DataManager.shared.weathers[indexPath.row].tempCurrent)"
            configuration.secondaryText = DataManager.shared.weathers[indexPath.row].date
            cell.contentConfiguration = configuration*/
            
        }
        
        //cell.contentConfiguration = configuration
        //return cell
        
    }
    
    
}
*/
