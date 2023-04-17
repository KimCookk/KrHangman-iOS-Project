import UIKit
import Foundation

class MainPageController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var mainPage: MainPage = {
        var page = MainPage()
        
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPageView()
        setEvent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setPageLayer()
    }
}

extension MainPageController {
    func setPageView() {
        view.backgroundColor = .white
        view.addSubview(mainPage)
        
        mainPage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func setEvent() {
        mainPage.contentView.menuButtonView.clickStartButton = clickStartButton
        mainPage.contentView.menuButtonView.clickShowRankButton = clickShowRankButton
        
        // 이렇게 되면 InputUserView가 init 되므로 ViewModel을 통한 필터 처리 필요
        mainPage.contentView.inputUserView.clickGoButton = clickGoButton
    }
    
    func setPageLayer() {
        mainPage.drawLayer()
    }
}

extension MainPageController {
    
    func clickStartButton() {
        print("MainPageController clickStartButton")
        if let coordinator = coordinator {
            coordinator.eventOccurred(with: .presentGamePage)
        }
    }
    
    func clickShowRankButton() {
        print("MainPageController clickShowRankButton")
        if let coordinator = coordinator {
            coordinator.eventOccurred(with: .presentRankPage)
        }
    }
    
    func clickGoButton() {
        print("MainPageController clickGoButton")
    }
}
