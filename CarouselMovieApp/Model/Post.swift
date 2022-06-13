//
//  Post.swift
//  CarouselMovieApp
//
//  Created by Vincentius Sutanto on 08/06/22.
//

import SwiftUI

// Post Model and Sample Data
struct Post: Identifiable {
    var id = UUID().uuidString
    var postImage: String
    var title: String
    var desc: String
    var rating: Float
    var starRating: Int
}

var posts = [
    Post(postImage: "post1", title: "Black Widow", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 4.3, starRating: 4),
    
    Post(postImage: "post2", title: "Captain Marvel", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 5.1, starRating: 5),

    Post(postImage: "post3", title: "Eternals", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 4.5, starRating: 4),

    Post(postImage: "post4", title: "Avenger: Infinity War", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 5.6, starRating: 5),
    
    Post(postImage: "post5", title: "Morbius", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 3.6, starRating: 3),
    
    Post(postImage: "post6", title: "Deadpool", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 4.5, starRating: 4),

    Post(postImage: "post7", title: "Avenger: End Game", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", rating: 5.3, starRating: 5)

]
