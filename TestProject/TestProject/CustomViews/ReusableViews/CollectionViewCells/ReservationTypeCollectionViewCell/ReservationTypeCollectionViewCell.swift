//
//  ReservationTypeCollectionViewCell.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import UIKit

class ReservationTypeCollectionViewCell: UICollectionViewCell {
    //MARK: - outlets
    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet weak var typeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customBackgroundView.layer.borderWidth = 1.0
        customBackgroundView.layer.borderColor = UIColor.blue.cgColor
    }
    
    func setupCell(model: ReservationTypeCollectionViewCellModel) {
        customBackgroundView.backgroundColor = model.backgroundColor
        typeNameLabel.textColor = model.textColor
        typeNameLabel.text = model.typeName
    }
}
