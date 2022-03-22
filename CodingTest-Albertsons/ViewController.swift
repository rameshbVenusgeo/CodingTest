//
//  ViewController.swift
//  CodingTest-Albertsons
//
//  Created by Ram on 21/03/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    lazy var viewModel: ViewModel = {
        let viewModel = ViewModel()
        return viewModel
    }()
    
    var dataSource: [AcromineElement] = []
    var searchString: String = ""
    
    var cancellable: AnyCancellable?
    
    let cellIdentifier = "cell"

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var acromineList: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.acromineList.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        bindViewModel()
    }
    
    private func bindViewModel() {
        loader.startAnimating()
        cancellable = viewModel.$acrominesList.sink(receiveValue: { (results) in
            DispatchQueue.main.async {
                [weak self] in
                guard let weakSelf = self else { return }
                if let acromines = results.first, let lfs = acromines.lfs  {
                    weakSelf.dataSource = lfs
                    weakSelf.acromineList.reloadData()
                }
                weakSelf.loader.stopAnimating()
            }
        })
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let acromine = dataSource[indexPath.row]
        
        if let acromineText = acromine.lf {
            cell.textLabel?.text = acromineText
        }
    
        return cell
    }
}

// MARK: UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        viewModel.getAcromineFor(searchString: searchString)
    }
}

