import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let albumsNavController = configure(VC: ViewController(),
                                            title: "Albums",
                                            image: "rectangle.stack.fill")
        let searchNavController = configure(VC: ViewController(),
                                            title: "Search",
                                            image: "magnifyingglass")
        viewControllers = [albumsNavController, searchNavController]
    }

    private func configure(VC: UIViewController, title: String, image: String) -> UINavigationController {
        let viewController = VC
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(systemName: image)
        return UINavigationController(rootViewController: viewController)
    }
}

