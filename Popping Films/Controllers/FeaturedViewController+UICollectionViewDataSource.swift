//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Popping Films
//
//  Created by rsbj on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title // <- pesquisar direferença entre row e item
            cell.imageView.image = UIImage(named: popularMovies[indexPath.row].backdrop)
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title // <- pesquisar direferença entre row e item
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.row].poster)
            cell.dateLabel.text = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            cell.titleLabel.text = upcomingMovies[indexPath.row].title
           /* let dateFormatter = DateFormatter()       <- Aprende sobre isso, mané
            dateFormatter.dateFormat = "MM-dd-yyyy" */
            cell.dateLabel.text = String(upcomingMovies[indexPath.item].releaseDate.prefix(4))
            cell.imageView.image = UIImage(named: upcomingMovies[indexPath.row].poster)
            return cell
        }
        return UpcomingCollectionViewCell()
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
