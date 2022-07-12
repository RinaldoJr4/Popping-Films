//
//  FeaturedViewController.swift
//  Popping Films
//
//  Created by rsbj on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    
//    let movieQuaquer = Movie(title: "HarryPoter", poster: "poster_harry.jpg", backdrop: "backdrop_harry.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho...", genres: ["Fantasia","Ação"])
//    não se usa prq eh muito grotesco e grande
    
    let movies = [Movie()]
    
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

