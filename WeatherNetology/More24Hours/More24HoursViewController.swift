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
        tableView.register(More24HoursSecondSectionTableViewCell.self, forCellReuseIdentifier: More24HoursSecondSectionTableViewCell.id)
        tableView.register(More24HoursFirstSectionTableViewCell.self, forCellReuseIdentifier: More24HoursFirstSectionTableViewCell.id)
        return tableView
    }()
    
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
            return 160
        } else {
            return 140
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.section == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: More24HoursFirstSectionTableViewCell.id, for: indexPath) as? More24HoursFirstSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")}
            return cell

        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: More24HoursSecondSectionTableViewCell.id, for: indexPath) as? More24HoursSecondSectionTableViewCell else {
                fatalError("could not dequeueReusableCell")}
            cell.configure(with: DataManager.shared.weathers[indexPath.row])
            return cell
        }
    }
}
