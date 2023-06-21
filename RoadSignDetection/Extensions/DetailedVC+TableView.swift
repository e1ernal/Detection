//
//  DetailedVC+TableView.swift
//  RoadSignDetection
//
//  Created by e1ernal on 21.06.2023.
//

import Foundation
import UIKit

extension DetailedVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        view.addSubview(infoTableView)
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        infoTableView.register(Cell.detailedCell.getClass, forCellReuseIdentifier: Cell.detailedCell.getId)
        infoTableView.register(Cell.signDetection.getClass, forCellReuseIdentifier: Cell.signDetection.getId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return signs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signs[0].labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detection = signs[indexPath.section]
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.signDetection.getId,
                                                     for: indexPath) as! SignDetectionCell
            
            cell.setupCell(image: signImages[indexPath.section])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.detailedCell.getId,
                                                     for: indexPath) as! DetailedCell
            
            let name = detection.labels[indexPath.row - 1].identifier.mlModelLabel()
            var value = detection.labels[indexPath.row - 1].confidence
            
            value = round(value * 10000) / 100.0
            cell.setupCell(name: name, value: "\(value)%")
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return signs[section].labels[0].identifier.mlModelLabel()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let screenSize: CGRect = UIScreen.main.bounds
        var height: CGFloat = CGFloat()
        if indexPath.row == 0 {
            height = screenSize.width
            return height
        }
        
        return UITableView.automaticDimension
    }
}

