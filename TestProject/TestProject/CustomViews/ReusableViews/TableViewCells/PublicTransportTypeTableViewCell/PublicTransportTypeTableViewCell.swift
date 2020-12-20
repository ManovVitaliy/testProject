//
//  PublicTransportTypeTableViewCell.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class PublicTransportTypeTableViewCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet weak var publicTransportImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var fromToLabel: UILabel!
    @IBOutlet weak var hasRestaurantImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(model: PublicTransportTypeTableViewCellModel) {
        typeLabel.text = model.type
        classLabel.text = model.classLevel
        lineLabel.text = model.lineIdentifier
        fromToLabel.text = model.fromTo
        if !model.hasRestaurantImageString.isEmpty {
            hasRestaurantImageView.image = UIImage(named: model.hasRestaurantImageString)
        } else {
            hasRestaurantImageView.image = nil
        }
    }
}
