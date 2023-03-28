import Foundation
import UIKit

class NavigationBarView: UIView {

    private var title: String

    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 3, 1], axis: .horizontal)
        
        
        return flexibleStackView
    }()
    
    var leftButtonView: UIView = {
        var view = UIView()
        
        return view
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    var rightButtonView: UIView = {
        var view = UIView()
        
        return view
    }()
    
    init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavigationBarView: View {
    func drawView() {
        titleLabel.text = title
        
        self.addSubview(container)
        container.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(0, addView: leftButtonView)
        leftButtonView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(1, addView: titleLabel)
        titleLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: rightButtonView)
        rightButtonView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
