//
//  EbikeTypeTableViewCell.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class EbikeTypeTableViewCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet weak var ebikeImageView: UIImageView!
    @IBOutlet weak var ebikeTypeLabel: UILabel!
    @IBOutlet weak var ebikeTagLabel: UILabel!
    @IBOutlet weak var ebikeSizeLabel: UILabel!
    @IBOutlet weak var fromToLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(model: EbikeTypeTableViewCellModel) {
        ebikeTypeLabel.text = model.type
        ebikeTagLabel.text = model.tagString
        ebikeSizeLabel.text = model.size
        fromToLabel.text = model.fromTo
    }
}
