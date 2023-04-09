import Foundation
import UIKit

class GamePageController: UIViewController, Coordinating, ViewContolling {
    var coordinator: Coordinator?
    var viewModel: ViewModel?
    
    var gamePage: GamePage = {
        var page = GamePage()
        
        return page
    }()
}

extension GamePageController {
    func setPageView() {
        
    }
    
    func setEvent() {
        
    }
    
    func setPageLayer() {
        
    }
}


