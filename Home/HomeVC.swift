//
//  HomeVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 12.11.22.
//

import UIKit
class HomeVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    // MARK: - Variables
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(type: PostTableCell.self)
        setupViewModel()
    }
    fileprivate func setupViewModel() {
        viewModel.getList()
        viewModel.successCallback = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.failureCallback = { [weak self] errorMessage in
            self?.showMessage(errorMessage)
//            print("jnje")
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(
            withType: PostTableCell.self,
            for: indexPath) as? PostTableCell else {
            return UITableViewCell()
        }
        cell.configureCell(item: viewModel.postList[indexPath.row])
        return cell
    }
}

