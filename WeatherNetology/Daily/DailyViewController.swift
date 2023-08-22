//
//  DailyViewController.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 15.08.2023.
//

import UIKit

class DailyViewController: UIViewController {
    
    //var currentIndex: Int
    
    
    var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DailySecondSectionTableViewCell.self, forCellReuseIdentifier: DailySecondSectionTableViewCell.id)
        tableView.register(DailyFirstSectionTableViewCell.self, forCellReuseIdentifier: DailyFirstSectionTableViewCell.id)
        //tableView.separatorColor = .white
        return tableView
    }()
    
    
    
    var dailyWeather: DailyWeather
    
    init(dailyWeather: DailyWeather) {
        self.dailyWeather = dailyWeather
        //self.currentIndex = currentIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setupConstraints()
        view.backgroundColor = .white

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

extension DailyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else {
            return 800
        }
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 2 {
            return "Ежедневный прогноз"
        }
        
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.section == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyFirstSectionTableViewCell.id, for: indexPath) as? DailyFirstSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
                
            }
            cell.completion = { dailyWeather in
                self.dailyWeather = dailyWeather
                tableView.reloadData()
            }
            //cell.currentIndex = 0
           //cell.collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .centeredVertically)
            //print ("cuurent index ", cell.currentIndex! )
            return cell

        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DailySecondSectionTableViewCell.id, for: indexPath) as? DailySecondSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            cell.configure(with: dailyWeather)
            return cell
            
            
        }
        
        
    }
    
    
}


/*import UIKit

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
    
    
}*/
