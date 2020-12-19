//
//  ShuttleTypeTableViewCell.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class ShuttleTypeTableViewCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet weak var shuttleImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var availableSeatsLabel: UILabel!
    @IBOutlet weak var wheelChairImageView: UIImageView!
    @IBOutlet weak var lineIdLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var fromToLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(model: ShuttleTypeTableViewCellModel) {
        typeLabel.text = model.type
        availableSeatsLabel.text = model.availableSeats
        if !model.isSupportWheelchairImageString.isEmpty {
            wheelChairImageView.image = UIImage(named: model.isSupportWheelchairImageString)
        } else {
            wheelChairImageView.image = nil
        }
        lineIdLabel.text = model.lineIDString
        lineView.backgroundColor = model.lineColor
        fromToLabel.text = model.fromTo
    }
}
