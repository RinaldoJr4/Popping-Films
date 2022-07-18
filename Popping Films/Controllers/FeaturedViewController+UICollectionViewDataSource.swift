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
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage()) // image: UIImage(named: popularMovies[indexPath.row].posterPath) ?? UIImage()
            
            let movie = popularMovies[indexPath.item]
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image)
            }
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let movie = popularMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       image: UIImage(), dateLabel: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))") // image: UIImage(named: popularMovies[indexPath.row].posterPath) ?? UIImage()
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image, dateLabel: "\(movie.releaseDate.prefix(4))")
            }
            return cell
//
//            cell.setup(title: nowPlayingMovies[indexPath.item].title,
//                       image: UIImage(named: nowPlayingMovies[indexPath.row].posterPath) ?? UIImage(),
//                       dateLabel: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))")
//
//            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {

            let movie = popularMovies[indexPath.item]
            
            // Formatando data pra upcoming
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
/*          let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd"    <- Desnecessário
*/

            cell.setup(title: movie.title, image: UIImage(), dateLabel: dateFormatterGet.date(from: String(upcomingMovies[indexPath.item].releaseDate))?.formatted(.dateTime
                .day(.defaultDigits)
                .month(.abbreviated)) ?? "error") // <- esse final vai explodir a minha cabeça
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image, dateLabel: dateFormatterGet.date(from: String(movie.releaseDate))?.formatted(.dateTime
                    .day(.defaultDigits)
                    .month(.abbreviated)) ?? "error")
            }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
    }
}

