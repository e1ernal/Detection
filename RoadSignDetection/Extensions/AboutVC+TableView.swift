//
//  AboutVC+TableView.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension AboutVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        aboutTableView.delegate = self
        aboutTableView.dataSource = self
        
        view.addSubview(aboutTableView)
        aboutTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutTableView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        aboutTableView.register(Cell.regular.getClass, forCellReuseIdentifier: Cell.regular.getId)
        
        sections = Sections.getSections()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.regular.getId, for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].cells[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.textAlignment = .justified
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        return sections[section].header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

