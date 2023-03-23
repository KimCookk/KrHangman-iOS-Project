import Foundation
import UIKit

class MenuButtonView: UIView {
    
    var container: FlexibleStackView = {
        var stackView = FlexibleStackView(ratios: [1,1,1], axis: .vertical)
        return stackView
    }()
    
    var startButton: UIButton = {
       var button = UIButton()
        button.setTitle("놀이 시작", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    var showRankButton: UIButton = {
        var button = UIButton()
        button.setTitle("순위 확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MenuButtonView: View {
    func drawView() {
        self.addSubview(container)
        container.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(0, addView: startButton)
        startButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: showRankButton)
        showRankButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
