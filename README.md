# XKCD Today
Displays the most recent [Xkcd](https://xkcd.com) comic!
---

[Screenshot](gh-assets/lone-view.png)

## View

Just an ImageView aligned to the edges.

## ViewController.Swift

Added this block to viewDidLoad():

```swift
ComicLoader.loadTodaysComic { (comic) in
    DispatchQueue.global().async {
        let imgUrl = URL(string: comic.img)!
        let data = try! Data(contentsOf: imgUrl)
        
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
    }
}
```

As well as an outlet to the ImageView created on main.storyboard:
```swift
@IBOutlet var imageView: UIImageView!
```

## ComicLoader.swift

Contains a struct and a class:

### class ComicLoader

Contains a static variable with the url to retrieve the most recent comic on [Xkcd's json interface](https://xkcd.com/json.html)

Also contains a static function
```swift
static func loadTodaysComic(completion: @escaping (Comic) -> Void)
```

### struct Comic: Codable

This is just to conform to Xkcd's json response format
