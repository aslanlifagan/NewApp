//
//  HomeVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 12.11.22.
//

import UIKit
class HomeVC: BaseVC {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Variables
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupView() {
        tableView.registerCell(type: CountryTableCell.self)
        setupViewModel()
    }
    fileprivate func setupViewModel() {
        viewModel.getAllCountriesList()
        viewModel.successCallback = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.failureCallback = { [weak self] errorMessage in
            self?.showMessage(errorMessage)
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(
            withType: CountryTableCell.self,
            for: indexPath) as? CountryTableCell else {
            return UITableViewCell()
        }
        cell.configureCell(item: viewModel.countryList[indexPath.row])
        return cell
    }
}

