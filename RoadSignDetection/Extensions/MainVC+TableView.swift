//
//  MainVC+TableView.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        signTableView.delegate = self
        signTableView.dataSource = self
        
        view.addSubview(signTableView)
        signTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signTableView.topAnchor.constraint(equalTo: view.topAnchor),
            signTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        signTableView.register(Cell.regular.getClass, forCellReuseIdentifier: Cell.regular.getId)
        signTableView.register(Cell.signDetection.getClass, forCellReuseIdentifier: Cell.signDetection.getId)
        signTableView.alwaysBounceVertical = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isImage ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionImageNumber = isImage ? 0 : 1
        let sectionButtonNumber = isImage ? 1 : 0
        
        switch indexPath.section {
        case sectionImageNumber:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.signDetection.getId,
                                                     for: indexPath) as! SignDetectionCell
            guard let image = signImage else { return cell }
            cell.setupCell(image: image)
            return cell
        case sectionButtonNumber:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.regular.getId,
                                                     for: indexPath)
            cell.textLabel?.text = "Select Image"
            cell.imageView?.image = UIImage(systemName: "rectangle.badge.plus")
            cell.textLabel?.textColor = .systemBlue
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.regular.getId,
                                                     for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        let sectionNumber = isImage ? 0 : 1
        switch section {
        case sectionNumber:
            return "Selected image for recognition"
        default:
            return "Take a photo or choose from the gallery"
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sectionImageNumber = isImage ? 0 : 1
        let sectionButtonNumber = isImage ? 1 : 0
        
        switch section {
        case sectionButtonNumber:
            return "Square images are preferred. Objects in the photo must be at least 10% of the size of the image"
        case sectionImageNumber:
            return "Signs found: \(signsCount)"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let screenSize: CGRect = UIScreen.main.bounds
        var height: CGFloat = CGFloat()
        if indexPath.section == 0 && indexPath.row == 0 && isImage {
            height = screenSize.width
            return height
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionNumber = isImage ? 1 : 0
        if indexPath.section == sectionNumber && indexPath.row == 0 {
            showImagePickerControllerActionSheet()
        }
    }
}
