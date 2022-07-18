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
    // doces.append("Brigadeiro") <- add "Brigadeiro no fim da lista de Strings"
    
    var popularMovies: [Movie] = [] // var popularMovies = Movie.popularMovies()
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
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
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.popularCollectionView.reloadData()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
}


