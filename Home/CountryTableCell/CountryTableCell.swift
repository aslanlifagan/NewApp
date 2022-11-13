//
//  CountryTableCell.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import UIKit

class CountryTableCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var flagImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(item: CountryElement) {
        title.text = item.name?.common
        subTitle.text = item.name?.official
        flagImage.loadFrom(URLAddress: item.flags?.png ?? "")
    }
}
