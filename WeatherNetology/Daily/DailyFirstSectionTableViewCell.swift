//
//  DailyFirstSectionTableViewCell.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 15.08.2023.
//

import UIKit

class DailyFirstSectionTableViewCell: UITableViewCell {
    
    //var currentIndex: Int
    
    //var delegate: DailyViewController
    
    //var mainController =  MainViewController()

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
        //collectionView.selectItem(at: IndexPath(row: 2, section: 0), animated: false, scrollPosition: .centeredVertically)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //dataManager.fetchCities()
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .bottom)
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
        //collectionView.selectItem(at: IndexPath(row: currentIndex!, section: 0), animated: false, scrollPosition: .centeredVertically)
       // let whiteView = UIView(frame: cell.bounds)
        //whiteView.backgroundColor = .white
        //cell.backgroundView = whiteView
        let blueView = UIView(frame: cell.bounds)
        blueView.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        blueView.layer.cornerRadius = 20
        cell.selectedBackgroundView = blueView
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        //if indexPath.row == currentIndex! {
        //    cell.backgroundColor = .orange
       // }
        //if cell.isSelected {cell.backgroundColor = .orange}
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // _ = collectionView.cellForItem(at: indexPath)!
        //cell.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        //collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        //self.currentIndex = indexPath.row
        //print(currentIndex)
        //cell.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        //cell.layer.cornerRadius = 10
        completion?(DataManager.shared.dailyWeather[indexPath.row])
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)!
        //cell.backgroundColor = .white
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


/*import UIKit

class SecondSectionTableViewCell: UITableViewCell {
    
    static let id = "SecondSectionTableViewCell_id"
    
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
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 22)
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "Ежедневный прогноз", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var forecastFor25Days7Days: UILabel = {
        
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 83, height: 20)
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "25 дней", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        view.addGestureRecognizer(guestureRecognizer)
        return view
    }()
    
    

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //dataManager.fetchCities()
        contentView.addSubview(collectionView)
        contentView.addSubview(everyDayForecast)
        contentView.addSubview(forecastFor25Days7Days)
        contentView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        DataManager.shared.completionForSecondSection = {
            //print ("colview upgraded")
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
            //collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
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
            print("UILabel clicked")
        }
    
    
    

}

extension SecondSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:SecondSectionCollectionViewCell.id, for: indexPath) as! SecondSectionCollectionViewCell
        //dataManager.fetchCities()
        cell.configure(with: DataManager.shared.weathers[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SecondSectionCollectionViewCell
        cell.backView.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        cell.date.textColor = .white
        cell.temperature.textColor = .white
        print ("Hello")
        
    }
    
}
extension SecondSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    /*private func itemWidth() -> CGFloat {
        let spacing = 8.0
        let width = view.safeAreaLayoutGuide.layoutFrame.width
        let itemsInRow: CGFloat = 3.0
        let totalSpacing: CGFloat = 2.0 * spacing + (itemsInRow - 1.0) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow - 2
        return floor(finalWidth)
    }*/
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           //let width = itemWidth()
           return CGSize(width: 58, height: 84)
       
   }
       
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
    

    
    

}*/
