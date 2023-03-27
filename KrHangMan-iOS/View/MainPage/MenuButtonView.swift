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
        UIService.setGrayRoundStyleButton(button)
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        
        return button
    }()
    
    var showRankButton: UIButton = {
        var button = UIButton()
        button.setTitle("순위 확인", for: .normal)
        UIService.setGrayRoundStyleButton(button)
        button.addTarget(self, action: #selector(tappedShowRankButton), for: .touchUpInside)

        return button
    }()
    
    var clickStartButton: (() -> ())?
    var clickShowRankButton: (() -> ())?
    
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
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: showRankButton)
        showRankButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview()
        }
    }
}

extension MenuButtonView {
    @objc func tappedStartButton() {
        if let clickStartButton = clickStartButton {
            clickStartButton()
        }
    }
    
    @objc func tappedShowRankButton() {
        if let clickShowRankButton = clickShowRankButton {
            clickShowRankButton()
        }
    }
}
