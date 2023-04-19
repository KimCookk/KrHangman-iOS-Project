import Foundation
import UIKit

class MainPage: UIView {
  
    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [5, 5], axis: .vertical)
        
        
        return flexibleStackView
    }()
    
    var contentView: MainPageContentView = {
        var view = MainPageContentView(isFirst: false)
        
        return view
    }()
    
    var title: UILabel = {
        var label = UILabel()
        label.text = "ᄒᆞᆫ글 행맨"
        label.textAlignment = .center

        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 80)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawPage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MainPage: Page {
    func drawPage() {
        self.addSubview(container)
        container.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.centerY.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self.safeAreaLayoutGuide)
        }
        
        container.appendView(0, addView: title)
        title.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        container.appendView(1, addView: contentView)
        contentView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func drawLayer() {
        let backgroundImage = UIService.getBackgroundImg(self)
        self.backgroundColor = UIColor(patternImage: backgroundImage)
    }
}
