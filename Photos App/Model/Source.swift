import UIKit


struct Source: Hashable {
    var title: String
    var photo: UIImage
    var count: String
}

struct AlbumsTitle {
    var title: String
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
        ],
        [
            Source(title: "Imports", photo: UIImage(systemName: "square.and.arrow.down") ?? UIImage(), count: "123"),
            Source(title: "Duplicates", photo: UIImage(systemName: "doc.on.doc") ?? UIImage(), count: "8"),
            Source(title: "Hidden", photo: UIImage(systemName: "eye.slash") ?? UIImage(), count: "32"),
            Source(title: "Recently Deleted", photo: UIImage(systemName: "trash.slash") ?? UIImage(), count: "37")
        ]

    ]
}

extension AlbumsTitle {
    static var albumName = [
        AlbumsTitle(title: "My Albums"),
        AlbumsTitle(title: "Shared Albums"),
        AlbumsTitle(title: "Social Albums"),
        AlbumsTitle(title: "Utilities")
    ]
}
