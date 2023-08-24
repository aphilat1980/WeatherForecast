//
//  FirstSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 25.07.2023.
//

import UIKit

class FirstSectionTableViewCell: UITableViewCell {

    static let id = "FirstSectionTableViewCell_id"
    
    var currentPage = 0
    
    //completion для обновления данных погоды на mainViewController при paging'е
    var completion: ((_ city:City)->())?
   
    //completion для перехода на экран 24часовой погоды с mainViewController
    var completion24Hours: (() -> ())?
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(FirstSectionCollectionViewCell.self, forCellWithReuseIdentifier: FirstSectionCollectionViewCell.id)
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: 0, width: 174, height: 20)
        pageControl.numberOfPages = DataManager.shared.cities.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .systemGray3
        pageControl.pageIndicatorTintColor = .black
        pageControl.backgroundStyle = .automatic
        return pageControl
    }()
    
    private lazy var forecastFor24Hours: UILabel = {
        
        var view = UILabel()
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        view.text = "Подробнее на 24 часа"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        view.addGestureRecognizer(guestureRecognizer)
        return view
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
        contentView.addSubview(forecastFor24Hours)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
        DataManager.shared.completionForFirstSection = {
            self.collectionView.reloadData()
            self.pageControl.numberOfPages = DataManager.shared.cities.count
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 242),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            forecastFor24Hours.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            forecastFor24Hours.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15)
        ])
    }
    
    
    @objc func labelClicked(_ sender: Any) {
        
        completion24Hours?()
    }
}


extension FirstSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataManager.shared.cities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:FirstSectionCollectionViewCell.id, for: indexPath) as! FirstSectionCollectionViewCell
        
        collectionView.collectionViewLayout.invalidateLayout()
        cell.configure(with: DataManager.shared.cities[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        DataManager.shared.fetchCurrentWeather(city:DataManager.shared.cities[currentPage])
        DataManager.shared.fetchWeather(city: DataManager.shared.cities[currentPage])
        DataManager.shared.fetchDailyWeather(city: DataManager.shared.cities[currentPage])
        completion?(DataManager.shared.cities[currentPage])
    }
}

extension FirstSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = contentView.safeAreaLayoutGuide.layoutFrame.width
           return CGSize(width: width, height: 242)
    }
       
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}



