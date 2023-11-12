import UIKit


struct Source {
    var title: String
    var photo: UIImage
    var count: String
}


extension Source {
    static var elements: [[Source]] = [
        [
            Source(title: "Recents", photo: UIImage(named: "image") ?? UIImage(), count: "12"),
            Source(title: "Family", photo: UIImage(named: "image") ?? UIImage(), count: "34"),
            Source(title: "Favorites", photo: UIImage(named: "image") ?? UIImage(), count: "57"),
            Source(title: "WhatsApp", photo: UIImage(named: "image") ?? UIImage(), count: "75"),
            Source(title: "Saved", photo: UIImage(named: "image") ?? UIImage(), count: "78"),
            Source(title: "Private", photo: UIImage(named: "image") ?? UIImage(), count: "23")
        ],
        [
            Source(title: "People & Places", photo: UIImage(named: "image2") ?? UIImage(), count: ""),
            Source(title: "Memories", photo: UIImage(named: "image2") ?? UIImage(), count: "")
        ],
        [
            Source(title: "Instagram", photo: UIImage(named: "image4") ?? UIImage(), count: "45"),
            Source(title: "Facebook", photo: UIImage(named: "image4") ?? UIImage(), count: "67"),
            Source(title: "YouTube", photo: UIImage(named: "image3") ?? UIImage(), count: "76")
        ]
        
    ]
}
