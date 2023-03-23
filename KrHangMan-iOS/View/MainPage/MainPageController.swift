import UIKit
import Foundation

class MainPageController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var mainPage: MainPage = {
        var pageView = MainPage()
        
        return pageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPageView()
    }
}

extension MainPageController {
    func setPageView() {
        view.addSubview(mainPage)
        mainPage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
