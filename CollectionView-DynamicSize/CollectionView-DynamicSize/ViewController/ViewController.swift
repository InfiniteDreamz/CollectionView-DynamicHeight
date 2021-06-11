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
        self.collectionView?.register(UINib(nibName: "DynamicCell", bundle: nil), forCellWithReuseIdentifier: "DynamicCell")
        self.collectionView?.dataSource = self
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCell", for: indexPath) as? DynamicCell else {
            fatalError()
        }
        cell.maxWidth = collectionView.frame.width
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
}

