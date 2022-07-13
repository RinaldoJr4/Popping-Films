//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  Popping Films
//
//  Created by rsbj on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == self.popularCollectionView {
            movie = popularMovies[indexPath.row]
        } else if collectionView == self.nowPlayingCollectionView {
            movie = nowPlayingMovies[indexPath.row]
        } else {
            movie = upcomingMovies[indexPath.row]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
