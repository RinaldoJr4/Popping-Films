//
//  TrendingViewController.swift
//  Popping Films
//
//  Created by rsbj on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    @IBOutlet var trendingSwitch: UISegmentedControl!
    @IBOutlet var trendingTableView: UITableView!
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            trendingMovies = trendingTodayMovies
            trendingTableView.reloadData()
        } else {
            trendingMovies = trendingThisWeekMovies
            trendingTableView.reloadData()
        }
    }
    
    var trendingTodayMovies : [Movie] = []
    var trendingThisWeekMovies : [Movie] = []
    
    // essa aqui vai a lista que vai exibida
    var trendingMovies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingTableView.delegate = self
        trendingTableView.dataSource = self

        Task{
            trendingTodayMovies = await Movie.trendingTodayMoviesAPI()
            trendingThisWeekMovies = await Movie.tredingThisWeekMoviesAPI()
            trendingMovies = trendingTodayMovies
            trendingTableView.reloadData()
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

}

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = trendingMovies[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TrendingTableViewCell {
            let movie = trendingMovies[indexPath.row]
            
            cell.setup(title: movie.title, image: UIImage(), dateLabel: String(movie.releaseDate.prefix(4)))
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData)
                
                cell.setup(title: movie.title, image: image ?? UIImage(), dateLabel: String(movie.releaseDate.prefix(4)))
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
