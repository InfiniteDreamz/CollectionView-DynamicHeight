//
//  HybridCell.swift
//  CollectionView-DynamicSize
//
//  Created by Peeyush Karnwal on 14/06/21.
//

import UIKit

enum OptiopVisibility {
    case showReservation
    case showAddress
    case showDuration
    case showPayment
    case showCancelButton
}

class HybridCell: UICollectionViewCell {

    var maxWidth: CGFloat = UIScreen.main.bounds.width {
        didSet {
            self.containerViewHeightConstraint?.constant = maxWidth
        }
    }
    
    @IBOutlet weak var viewReservaation: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewDuration: UIView!
    @IBOutlet weak var viewCancelBooking: UIView!
    @IBOutlet weak var viewPayment: UIView!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with options: [OptiopVisibility]) {
        self.viewReservaation.isHidden = !options.contains(.showReservation)
        self.viewAddress.isHidden = !options.contains(.showAddress)
        self.viewDuration.isHidden = !options.contains(.showDuration)
        self.viewPayment.isHidden = !options.contains(.showPayment)
        self.viewCancelBooking.isHidden = !options.contains(.showCancelButton)
    }
}
