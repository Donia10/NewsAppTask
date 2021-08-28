//
//  ViewController.swift
//  NewsApp
//
//  Created by Donia Ashraf on 25/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
class NewsViewController: UIViewController {
    
    @IBOutlet private weak var newsTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private var newsViewsModel:NewsViewModel?
    private var articles:[Article]?
    private var orginalArticles:[Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
        newsViewsModel = NewsViewModel()
        articles = [Article]()
        orginalArticles = [Article]()
        
        newsViewsModel?.bindToView = { [weak self] in
            guard let articles = self?.newsViewsModel?.articles else{ return }
            self?.orginalArticles = articles
            self?.articles = articles
            self?.newsTableView.reloadData()
        }
        newsViewsModel?.bindErrorToView = onFailUpdateView
    }
        
    func onFailUpdateView() {
        let alert = UIAlertController(title: "Error", message: newsViewsModel?.error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
 
    func setupUI() {
        let searchTextField:UITextField = searchBar.searchTextField
        searchTextField.textAlignment = NSTextAlignment.right
        let image:UIImage = UIImage(named: "search")!
        let imageView:UIImageView = UIImageView.init(image: image)
        searchTextField.leftView = nil
        searchTextField.rightView = imageView
        searchTextField.rightViewMode = UITextField.ViewMode.always
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xEAEAEA)
        
    }
}
extension NewsViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTableView", for: indexPath) as! NewsTableViewCell
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        cell.article = articles?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsDetails = (storyboard?.instantiateViewController(withIdentifier: "NewsDetailsViewController")) as? NewsDetailsViewController
            else {return}
        newsDetails.article = articles?[indexPath.row]
        navigationController?.pushViewController(newsDetails, animated: true)
        
    }
}
extension NewsViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        articles = newsViewsModel?.search(articles: orginalArticles ?? [], searchText: searchText)
        newsTableView.reloadData()
    }
}
extension NewsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(true)
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
