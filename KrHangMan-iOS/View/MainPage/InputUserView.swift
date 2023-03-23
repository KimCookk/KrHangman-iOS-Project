import Foundation
import UIKit

class InputUserView: UIView {
    
    var container: FlexibleStackView = {
        var stackView = FlexibleStackView(ratios: [1,1,1], axis: .vertical)
        return stackView
    }()
    
    var inputUserNameTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "유저명을 입력해주세요."
        return textField
    }()
    
    var goButton: UIButton = {
        var button = UIButton()
        button.setTitle("놀러가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InputUserView: View {
    func drawView() {
        self.addSubview(container)
        container.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(0, addView: inputUserNameTextField)
        inputUserNameTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: goButton)
        goButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
