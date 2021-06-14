//
//  ViewController.swift
//  CollectionView-DynamicSize
//
//  Created by Peeyush Karnwal on 11/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
}

private extension ViewController {
    
    func configureView() {
        self.collectionView?.register(UINib(nibName: "HybridCell", bundle: nil), forCellWithReuseIdentifier: "HybridCell")
        self.collectionView?.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HybridCell", for: indexPath) as? HybridCell else {
            fatalError()
        }
        cell.maxWidth = collectionView.frame.width
        switch indexPath.row {
        case 0:
            cell.configure(with: [.showAddress, .showCancelButton, .showDuration, .showReservation])
        case 1:
            cell.configure(with: [.showPayment, .showAddress, .showDuration, .showReservation])
        case 2:
            cell.configure(with: [.showAddress, .showDuration, .showReservation])
        case 3:
            cell.configure(with: [.showPayment, .showAddress, .showDuration, .showReservation])
        case 4:
            cell.configure(with: [.showPayment, .showAddress, .showDuration, .showReservation])
        case 5:
            cell.configure(with: [.showAddress, .showCancelButton, .showDuration, .showReservation])
        case 6:
            cell.configure(with: [.showAddress, .showDuration])
        case 7:
            cell.configure(with: [.showPayment, .showAddress, .showCancelButton, .showDuration])
        case 8:
            cell.configure(with: [.showAddress, .showCancelButton, .showDuration])
        default:
            cell.configure(with: [.showPayment, .showAddress, .showCancelButton, .showDuration, .showReservation])
        }
        return cell
    }
    
}

