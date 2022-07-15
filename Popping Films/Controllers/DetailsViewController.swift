//
//  DetailsViewController.swift
//  Popping Films
//
//  Created by rsbj on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        
//        ESTUDAR ESSA PARTE COM MUITO DETALHE
        Task {
        let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = image // UIImage(named: movie.backdropPath)
        }
        Task {
        let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: imageData) ?? UIImage()
            self.posterImage.image = image // UIImage(named: movie.posterPath)
        }
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
//     
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
