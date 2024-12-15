//
//  MovieScreen.swift
//  Movies Info
//
//  Created by Kushang  on 16/11/24.
//

import UIKit
import SDWebImage

class MovieScreen: UIViewController {

    // MARK: - IB Outlet
    @IBOutlet weak var imdbView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    
    // MARK: - Variables
    var movieData: MoviesDataResponse?
    var back: (()->Void)?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialise()
    }
    
    // MARK: - Function's
    func initialise(){
        self.mangeUI()
    }
    
    func mangeUI(){
        self.imdbView.layer.cornerRadius = 25
        self.moreInfoButton.layer.cornerRadius = 25
        self.backView.layer.cornerRadius = 25
        self.ratingLabel.text = "IMDB: \(self.movieData?.imdbRating ?? "")"
        self.movieImageView.sd_setImage(with: URL(string: self.movieData?.poster ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.movieNameLabel.text = self.movieData?.title ?? ""
        self.informationLabel.text = self.movieData?.plot ?? ""
        self.languageLabel.text = "Languages: \(self.movieData?.language ?? "")"
    }
    // MARK: - IB  Actoin method
    @IBAction func onBack(_ sender: Any) {
        self.back?()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onMoreinfo(_ sender: Any) {
    }
}

// MARK: - Extension

// MARK: - Delegate method

// MARK: - API Call
