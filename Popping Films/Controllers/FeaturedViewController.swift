//
//  FeaturedViewController.swift
//  Popping Films
//
//  Created by rsbj on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    //    let movieQuaquer = Movie(title: "HarryPoter", poster: "poster_harry.jpg", backdrop: "backdrop_harry.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho...", genres: ["Fantasia","Ação"])
    //    não se usa prq eh muito grotesco e grande
    
    // let movies = [Movie()]
    
    // Inicializando array de strings vazio
    // var doces: [String]= []
    // doces.append("Brigadeiro")
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
}


