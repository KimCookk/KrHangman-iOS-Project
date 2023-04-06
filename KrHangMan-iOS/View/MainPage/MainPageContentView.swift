import Foundation
import UIKit

class MainPageContentView: UIView {
    
    var isFirst: Bool
    
    lazy var inputUserView: InputUserView = {
        var view = InputUserView()
        
        return view
    }()
    
    lazy var menuButtonView: MenuButtonView = {
        var view = MenuButtonView()
        
        return view
    }()
    
    var contentView: UIView {
        switch isFirst {
        case true :
            return inputUserView
        case false :
            return menuButtonView
        }
    }
    
    
    init(frame: CGRect, _ isFirst: Bool) {
        self.isFirst = isFirst
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainPageContentView: View {
    func drawView() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.1)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func drawLayer() {
        
    }
    
}
