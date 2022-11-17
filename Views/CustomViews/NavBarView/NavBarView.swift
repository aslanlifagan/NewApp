//
//  NavBarView.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import UIKit

class NavBarView: UIView, NibLoadable {

    // Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - Private Functions
    private func setupView() {
        setupTargets()
    }
    private func setupTargets() {
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    // MARK: - Public Functions
    public func setTitle(title: String?) {
        titleLabel.text = title
    }
    // MARK: - @objc Functions
    @objc func backButtonClicked() {
        let nav = UIApplication.getPresentedViewController() as! BaseNavigation
        nav.popViewController(animated: true)
    }
}
