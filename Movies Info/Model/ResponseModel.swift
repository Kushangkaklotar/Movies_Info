//
//  ResponseModel.swift
//  Movies Info
//
//  Created by Kushang  on 05/11/24.
//

import Foundation
import ObjectMapper

// API Response model
class MoviesDataResponse: Mappable {

    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var ratings: [Ratings]?
    var metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var dVD: String?
    var boxOffice: String?
    var production: String?
    var website: String?
    var response: Bool?

    required init?(map: Map){
    }
    
    init(title: String? = nil, year: String? = nil, rated: String? = nil, released: String? = nil, runtime: String? = nil, genre: String? = nil, director: String? = nil, writer: String? = nil, actors: String? = nil, plot: String? = nil, language: String? = nil, country: String? = nil, awards: String? = nil, poster: String? = nil, ratings: [Ratings]? = nil, metascore: String? = nil, imdbRating: String? = nil, imdbID: String? = nil, type: String? = nil, dVD: String? = nil, boxOffice: String? = nil, production: String? = nil, website: String? = nil, response: Bool? = nil) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.ratings = ratings
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbID = imdbID
        self.type = type
        self.dVD = dVD
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.response = response
    }

    func mapping(map: Map) {
        title <- map["Title"]
        year <- map["Year"]
        rated <- map["Rated"]
        released <- map["Released"]
        runtime <- map["Runtime"]
        genre <- map["Genre"]
        director <- map["Director"]
        writer <- map["Writer"]
        actors <- map["Actors"]
        plot <- map["Plot"]
        language <- map["Language"]
        country <- map["Country"]
        awards <- map["Awards"]
        poster <- map["Poster"]
        ratings <- map["Ratings"]
        metascore <- map["Metascore"]
        imdbRating <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
        imdbID <- map["imdbID"]
        type <- map["Type"]
        dVD <- map["DVD"]
        boxOffice <- map["BoxOffice"]
        production <- map["Production"]
        website <- map["Website"]
        response <- map["Response"]
    }
}

class Ratings: Mappable {

    var source: String?
    var value: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        source <- map["Source"]
        value <- map["Value"]
    }
}


// API Response model
class MoviesDataResponse2: Codable {

    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
//    var ratings: [Ratings]?
    var metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var dVD: String?
    var boxOffice: String?
    var production: String?
    var website: String?
    var response: Bool?
    
    init(title: String? = nil, year: String? = nil, rated: String? = nil, released: String? = nil, runtime: String? = nil, genre: String? = nil, director: String? = nil, writer: String? = nil, actors: String? = nil, plot: String? = nil, language: String? = nil, country: String? = nil, awards: String? = nil, poster: String? = nil, ratings: [Ratings]? = nil, metascore: String? = nil, imdbRating: String? = nil, imdbID: String? = nil, type: String? = nil, dVD: String? = nil, boxOffice: String? = nil, production: String? = nil, website: String? = nil, response: Bool? = nil) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
//        self.ratings = ratings
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbID = imdbID
        self.type = type
        self.dVD = dVD
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.response = response
    }

//    required init?(map: Map){
//    }

//    func mapping(map: Map) {
//        title <- map["Title"]
//        year <- map["Year"]
//        rated <- map["Rated"]
//        released <- map["Released"]
//        runtime <- map["Runtime"]
//        genre <- map["Genre"]
//        director <- map["Director"]
//        writer <- map["Writer"]
//        actors <- map["Actors"]
//        plot <- map["Plot"]
//        language <- map["Language"]
//        country <- map["Country"]
//        awards <- map["Awards"]
//        poster <- map["Poster"]
//        ratings <- map["Ratings"]
//        metascore <- map["Metascore"]
//        imdbRating <- map["imdbRating"]
//        imdbVotes <- map["imdbVotes"]
//        imdbID <- map["imdbID"]
//        type <- map["Type"]
//        dVD <- map["DVD"]
//        boxOffice <- map["BoxOffice"]
//        production <- map["Production"]
//        website <- map["Website"]
//        response <- map["Response"]
//    }
}

class Ratings2: Codable {

    var source: String?
    var value: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        source <- map["Source"]
        value <- map["Value"]
    }
}
