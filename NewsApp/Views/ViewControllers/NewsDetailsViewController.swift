//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Donia Ashraf on 27/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var newssourceName: UILabel!
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsDescription: UITextView!
    @IBOutlet private weak var pView: UIView!
    @IBOutlet private weak var cView: UIView!
    private var button:UIBarButtonItem?
    var article:Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIBarButtonItem.init(image: UIImage(named: "upload"), style: .plain, target: self, action: #selector(self.actionBarButton))
        self.navigationItem.rightBarButtonItem = button
        setupUI()
        pView.layer.cornerRadius = 15
        cView.layer.cornerRadius = 15
        
    }
    func setupUI() {
        newsTitle.text = article?.newsTitle
        newsImage.sd_setImage(with: URL(string: article?.newsImage ?? ""), placeholderImage: UIImage(named: "noimg"))
        newssourceName.text = article?.newsSource.name
        guard article?.newsDescription != nil else { return }
        newsDescription.text = article?.newsDescription
        
    }
    @objc func actionBarButton() {
    }
    
}
