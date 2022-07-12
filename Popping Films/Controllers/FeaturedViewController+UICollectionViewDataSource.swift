//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Popping Films
//
//  Created by rsbj on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
                cell.titleLabel.text = popularMovies[indexPath.item].title // <- pesquisar direferença entre row e item
                cell.imageView.image = UIImage(named: popularMovies[indexPath.row].backdrop)
                return cell
            }
            
        } else if collectionView == nowPlayingCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell {
                cell.titleLabel.text = nowPlayingMovies[indexPath.item].title // <- pesquisar direferença entre row e item
                cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
                cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
                return cell
            }
            
        } else if collectionView == upcomingCollectionView {
            if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell {
                cell.titleLabel.text = upcomingMovies[indexPath.row].title
                cell.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
                cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
                return cell
            }
            
        } else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        cell?.titleLabel.text = popularMovies[indexPath.item].title // <- pesquisar direferença entre row e item
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.row].backdrop)
        
        return cell ?? UICollectionViewCell()
    }
}
