import UIKit
import Foundation


class RankPageController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var mainPage: MainPage = {
        var pageView = MainPage()
        
        return pageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setPageView()
//        setEvent()
    }
}
