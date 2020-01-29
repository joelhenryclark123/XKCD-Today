//
//  ComicLoader.swift
//  XKCD Today
//
//  Created by Joel Clark on 1/28/20.
//  Copyright © 2020 MyCo. All rights reserved.
//

import Foundation

class ComicLoader {
    static let todaysComicUrl = "https://xkcd.com/info.0.json"
    
    static func loadTodaysComic(completion: @escaping (Comic) -> Void) {
        let jsonUrl = URL(string: ComicLoader.todaysComicUrl)!

        URLSession.shared.dataTask(with: jsonUrl) { (d, r, e) in
            guard let data = d else { return }
            let decoder = JSONDecoder()
            let comic = try! decoder.decode(Comic.self, from: data)
            completion(comic)
        }.resume()
    }
}

struct Comic: Codable {
    var month: String
    var num: Int
    var year: String
    var news: String
    var safe_title: String
    var transcript: String
    var alt: String
    var img: String
    var title: String
    var day: String
}
