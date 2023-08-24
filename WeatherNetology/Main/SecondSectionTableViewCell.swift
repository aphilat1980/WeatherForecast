//
//  SecondSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 25.07.2023.
//

import UIKit

class SecondSectionTableViewCell: UITableViewCell {
    
    static let id = "SecondSectionTableViewCell_id"
    
    //completion для перехода на экран 24часа с mainViewController
    var completion24Hours: (() -> ())?
    
    //по идее переход на прошгноз на 24 дня, но не нашел api - сделал alert
    var completion24Days: (() -> ())?
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(SecondSectionCollectionViewCell.self, forCellWithReuseIdentifier: SecondSectionCollectionViewCell.id)
        return collectionView
    }()
    
    
    private lazy var everyDayForecast: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        view.text = "Ежедневный прогноз"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var forecastFor25Days7Days: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 83, height: 20)
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.text = "25 дней"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        view.addGestureRecognizer(guestureRecognizer)
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        contentView.addSubview(everyDayForecast)
        contentView.addSubview(forecastFor25Days7Days)
        contentView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        DataManager.shared.completionForSecondSection = {
            self.collectionView.reloadData()
        }
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 124),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            everyDayForecast.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            everyDayForecast.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            forecastFor25Days7Days.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            forecastFor25Days7Days.topAnchor.constraint(equalTo: everyDayForecast.topAnchor)
        ])
    }
    
    @objc func labelClicked(_ sender: Any) {
            completion24Days?()
    }
}

extension SecondSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:SecondSectionCollectionViewCell.id, for: indexPath) as! SecondSectionCollectionViewCell
        cell.configure(with: DataManager.shared.weathers[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion24Hours?()
    }
}

extension SecondSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
       return CGSize(width: 58, height: 84)
    }
       
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
}
