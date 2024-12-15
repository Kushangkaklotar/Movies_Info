//
//  HomeScreen.swift
//  Movies Info
//
//  Created by Kushang  on 04/11/24.
//

import UIKit
import Alamofire
import ObjectMapper

class HomeScreen: UIViewController {

    // MARK: - IB Outlet
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var topMovieCollectionView: UICollectionView!{
        didSet{
            let nib = UINib(nibName: "TopMovieCell", bundle: nil)
            self.topMovieCollectionView?.register(nib, forCellWithReuseIdentifier: "TopMovieCell")
        }
    }
    
    // MARK: - Variables
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var userDefaults = UserDefaults.standard
    var avalableMovies: [MoviesDataResponse] = []
    let loader = UIAlertController(title: nil, message: "Find movie for you", preferredStyle: .alert)
//    let loader = LoaderViewController()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialise()
    }
    
    // MARK: - Function's
    func initialise() {
        self.mangeUI()
        if let savedNotesData = UserDefaults.standard.data(forKey: USER_DEFAULT_KEY),
           let savedNotes = try? JSONDecoder().decode([MoviesDataResponse2].self, from: savedNotesData) {
            for i in savedNotes {
                MOVIES.append(i)
                let movieArray = [MoviesDataResponse(title: i.title , year: i.year, rated: i.rated, released: i.released, runtime: i.runtime, genre: i.genre, director: i.director, writer: i.writer, actors: i.actors, plot: i.plot, language: i.language, country: i.country, awards: i.awards, poster: i.poster, ratings: nil, metascore: i.metascore, imdbRating: i.imdbRating, imdbID: i.imdbID, type: i.type, dVD: i.dVD, boxOffice: i.boxOffice, production: i.production, website: i.website, response: i.response)]
                self.avalableMovies.append(contentsOf: movieArray)
            }
        }
        
    }
    func mangeUI() {
        self.searchView.layer.cornerRadius = 24
        self.searchView.layer.borderWidth = 1
        self.searchView.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
    }
    // MARK: - IB Actoin method
    @IBAction func onSearch(_ sender: Any) {
//        view.loader()
        if self.movieTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count != 0 {
            // Alert loader
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            loader.view.addSubview(loadingIndicator)
            self.present(loader, animated: true)
            
            self.fetchMovieDetails(title: self.movieTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "") { result in
                switch result {
                case .success(let movieData):
                    do {
                        let dict = movieData as [String: Any]
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
                        if let dictFromJSON = decoded as? [String:Any] {
                            if let movieMappableObj = MoviesDataResponse(JSON: dictFromJSON) {
                                if movieMappableObj.imdbID != nil {
                                    self.avalableMovies.insert(movieMappableObj, at: 0)
                                    let movieArray = [MoviesDataResponse2(title: movieMappableObj.title, year: movieMappableObj.year, rated: movieMappableObj.rated, released: movieMappableObj.released, runtime: movieMappableObj.runtime, genre: movieMappableObj.genre, director: movieMappableObj.director, writer: movieMappableObj.writer, actors: movieMappableObj.actors, plot: movieMappableObj.plot, language: movieMappableObj.language, country: movieMappableObj.country, awards: movieMappableObj.awards, poster: movieMappableObj.poster, ratings: nil, metascore: movieMappableObj.metascore, imdbRating: movieMappableObj.imdbRating, imdbID: movieMappableObj.imdbID, type: movieMappableObj.type, dVD: movieMappableObj.dVD, boxOffice: movieMappableObj.boxOffice, production: movieMappableObj.production, website: movieMappableObj.website, response: movieMappableObj.response)]
                                    MOVIES.insert(contentsOf: movieArray, at: 0)
                                    self.topMovieCollectionView.reloadData()
                                    if let encodedNotes = try? JSONEncoder().encode(MOVIES) {
                                        UserDefaults.standard.set(encodedNotes, forKey: USER_DEFAULT_KEY)
                                    }
                                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                                    if let vc = storyboard.instantiateViewController(withIdentifier: "MovieScreen") as? MovieScreen {
                                        vc.movieData = movieMappableObj
                                        vc.back = { [weak self] in
                                            self?.movieTextField.text = ""
                                        }
                                        self.navigationController?.pushViewController(vc, animated: true)
                                    }
                                } else {
                                    Utility.errorAlert(message: "We are unable to movie/series name \(self.movieTextField.text ?? "")", view: self.view)
                                }
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print("Error fetching movie: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

// MARK: - Extension

// MARK: - Delegate method
extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.avalableMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopMovieCell", for: indexPath) as! TopMovieCell
        cell.movieImageView.sd_setImage(with: URL(string: self.avalableMovies[indexPath.row].poster ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MovieScreen") as? MovieScreen {
            vc.movieData = self.avalableMovies[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: topMovieCollectionView.frame.width, height: topMovieCollectionView.frame.height)
    }
    
}

// MARK: - API Call
extension HomeScreen {
    func fetchMovieDetails(title: String, completion: @escaping (Result<[String: Any]>) -> Void) {
        let apiKey = "d8a6f01c"  // Replace with your API key
        let url = "https://www.omdbapi.com/"
        
        let parameters: [String: String] = [
            "apikey": apiKey,
            "t": title
        ]
        
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            DispatchQueue.main.async{
                self.loader.dismiss(animated: true)
            }
            switch response.result {
                
            case .success(let value):
                if let json = value as? [String: Any] {
                    completion(.success(json))
//                    print(json)
                } else {
                    print(response)
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON response"])))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
