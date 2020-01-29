//
//  ViewController.swift
//  XKCD Today
//
//  Created by Joel Clark on 1/28/20.
//  Copyright © 2020 MyCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ComicLoader.loadTodaysComic { (comic) in
            DispatchQueue.global().async {
                let imgUrl = URL(string: comic.img)!
                let data = try! Data(contentsOf: imgUrl)
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
