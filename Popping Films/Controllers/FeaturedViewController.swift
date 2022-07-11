//
//  FeaturedViewController.swift
//  Popping Films
//
//  Created by rsbj on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        
    }
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        cell?.titleLabel.text = "Titulo do Filme"
        cell?.image.image = UIImage()
        
        return cell ?? UICollectionViewCell()
    }
}

