//
//  TopMovieCell.swift
//  Movies Info
//
//  Created by Kushang  on 24/11/24.
//

import UIKit

class TopMovieCell: UICollectionViewCell {

    // MARK: - IB Outlet
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialse()
    }

    func initialse(){
        self.movieImageView.layer.cornerRadius = 10
        self.movieImageView.image = UIImage(named: "myIm")
    }
}
