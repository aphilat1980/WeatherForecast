//
//  DailyFirstSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 15.08.2023.
//

import UIKit

class DailyFirstSectionTableViewCell: UITableViewCell {
    
    static let id = "DailyFirstSectionTableViewCell_id"
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd/MM"
        return formatter
    } ()
    
    var completion: ((_ weather:DailyWeather)->())?
    
    let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //collectionView.heightAnchor.constraint(equalToConstant: 124),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
    }
}


extension DailyFirstSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.shared.dailyWeather.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        let date = NSDate(timeIntervalSince1970: TimeInterval(DataManager.shared.dailyWeather[indexPath.row].dateSince1970))
        title.text = formatter.string(from: date as Date)
        let blueView = UIView(frame: cell.bounds)
        blueView.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        blueView.layer.cornerRadius = 20
        cell.selectedBackgroundView = blueView
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion?(DataManager.shared.dailyWeather[indexPath.row])
    }
}

extension DailyFirstSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 88, height: 50)
    }
       
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    }
}
