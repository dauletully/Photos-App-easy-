import UIKit


struct Source {
    var title: String
    var photo: UIImage
}

extension Source {
    static var elements: [[Source]] = [
        [
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage()),
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage()),
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage()),
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage()),
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage()),
        Source(title: "1", photo: UIImage(named: "image") ?? UIImage())
        ],
        [
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage()),
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage()),
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage()),
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage()),
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage()),
        Source(title: "2", photo: UIImage(named: "image2") ?? UIImage())
        ],
        
    ]
}
