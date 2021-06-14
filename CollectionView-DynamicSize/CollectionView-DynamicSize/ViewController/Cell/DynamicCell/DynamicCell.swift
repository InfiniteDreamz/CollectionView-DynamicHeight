//
//  DynamicCells.swift
//  CollectionView_AutomaticDimentions_Demo
//
//  Created by Peeyush Karnwal on 11/06/21.
//

//
//  DynamicCells.swift
//
//  Created by Peeyush Karnwal on 11/06/21.
//

import UIKit

class DynamicCell: UICollectionViewCell {
    
    var maxWidth: CGFloat = UIScreen.main.bounds.width {
        didSet {
            self.containerViewHeightConstraint?.constant = maxWidth
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelDescription: UILabel?
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with viewModel: DummyViewModel) {
        self.labelTitle?.text = viewModel.title
        self.labelDescription?.text = viewModel.info
    }
}
