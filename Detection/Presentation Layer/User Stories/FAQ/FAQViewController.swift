//
//  FAQViewController.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

import UIKit

final class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    var faqView: FAQView
    var faqData: FAQData {
        didSet {
            faqView.refresh()
        }
    }
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        faqData = FAQData.configure()
        faqView = FAQView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "FAQ")
        faqView.configure(delegate: self, dataSource: self)
        faqData = FAQData.configure()
    }
    
    override func loadView() {
        self.view = faqView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    // UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return faqData.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqData.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        faqData.sections[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        faqData.sections[section].footer
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        
        let textString = "The list contains road signs used in Russia. "
        let linkString = "Learn more..."
        let footerString = textString + linkString
                
        let colorAttribute = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let linkAttribute = [NSAttributedString.Key.link: URL.roadSignsWiki]
        
        let attributedString = NSMutableAttributedString(string: footerString)
        attributedString.addAttributes(colorAttribute, range: NSRange(location: 0, length: footerString.count))
        attributedString.addAttributes(linkAttribute, range: NSRange(location: textString.count, length: linkString.count))
        
        let footer = UITextView()
        footer.isUserInteractionEnabled = true
        footer.isEditable = false
        footer.backgroundColor = .clear
        footer.attributedText = attributedString

        return footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = faqData.sections[indexPath.section].rows[indexPath.row]
        
        switch row.type {
        case .question:
            let cell = tableView.dequeue(SettingsCell.self, for: indexPath)
            guard let row = row as? FAQRowQuestion else { return cell }
            cell.configure(title: row.text)
            return cell
        case .questionAnswer:
            let cell = tableView.dequeue(FAQQuestionAnswerCell.self, for: indexPath)
            guard let row = row as? FAQRowQuestionAnswer else { return cell }
            cell.configure(title: row.question, subtitle: row.answer)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.section == 0 || indexPath.section == 1 else { return }
        
        let section = indexPath.section
        let nextVC = section == 0 ? HowToUseViewController() : RecognizableObjectsViewController()
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: FAQViewController.self))") }
}
