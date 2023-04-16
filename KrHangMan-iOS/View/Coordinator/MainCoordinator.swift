import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil

    func eventOccurred(with type: Event) {
        if let navigationController = navigationController {
            switch type {
            case .presentRankPage:
                var viewController: UIViewController & Coordinating = RankPageController()
                viewController.coordinator = self
                
                navigationController.pushViewController(viewController, animated: true)
            case .backPage:
                navigationController.popViewController(animated: true)
            }
        }
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = MainPageController()
        viewController.coordinator = self

        navigationController?.setViewControllers([viewController], animated: false)
    }
}
