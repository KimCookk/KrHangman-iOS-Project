import Foundation
import UIKit

class MainPage: UIView {
  
    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 1], axis: .vertical)
        
        
        return flexibleStackView
    }()
    
    var title: UILabel = {
        var label = UILabel()
        label.text = "ᄒᆞᆫ글 행맨"
        label.textAlignment = .center

        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 10)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawPageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MainPage: PageView {
    func drawPageView() {
        self.addSubview(container)
        container.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.addStackView(0, addView: title)
        title.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        title.sizeToFit()
        
    }
}
