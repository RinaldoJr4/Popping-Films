//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Popping Films
//
//  Created by rsbj on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title // <- pesquisar direferença entre row e item
            cell.imageView.image = UIImage(named: popularMovies[indexPath.row].backdrop)
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell {
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title // <- pesquisar direferença entre row e item
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
            cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell {
            cell.titleLabel.text = upcomingMovies[indexPath.row].title
            cell.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            return makePopularCell(collectionView, indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(collectionView, indexPath)
        } else if collectionView == upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        } else {
        return UICollectionViewCell()
        }
        /* let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        cell?.titleLabel.text = popularMovies[indexPath.item].title // <- pesquisar direferença entre row e item
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.row].backdrop)
        
        return cell ?? UICollectionViewCell() */
    }
}
