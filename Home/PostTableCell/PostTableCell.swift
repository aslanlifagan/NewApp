//
//  PostTableCell.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import UIKit

class PostTableCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(item: PostModel) {
        title.text = item.title
        subTitle.text = item.body
    }
}
