import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil

    func eventOccurred(with type: Event) {
        
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = MainPageController()
        viewController.coordinator = self

        navigationController?.setViewControllers([viewController], animated: false)
    }
}
