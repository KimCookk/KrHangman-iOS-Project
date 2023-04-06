import Foundation
import UIKit

class NavigationBarView: UIView {

    private var title: String

    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 3, 1], axis: .horizontal)
        
        
        return flexibleStackView
    }()
    
    var barLeftView: UIView = {
        var view = UIView()
        
        return view
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 25)
        
        return label
    }()
    
    var barRightView: UIView = {
        var view = UIView()
        
        return view
    }()
    
    var leftView: UIView?
    
    var rightView: UIView?
    
    init(frame: CGRect, title: String, leftView: UIView? = nil, rightView: UIView? = nil) {
        self.title = title
        if let leftView = leftView {
            self.leftView = leftView
        }
        if let rightView = rightView {
            self.rightView = rightView
        }
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
        
        container.appendView(0, addView: barLeftView)
        barLeftView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        if let leftView = leftView {
            barLeftView.addSubview(leftView)
            leftView.snp.makeConstraints{ (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview()
            }
        }
        
        container.appendView(1, addView: titleLabel)
        titleLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: barRightView)
        barRightView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        if let rightView = rightView {
            barRightView.addSubview(rightView)
            rightView.snp.makeConstraints{ (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview()
            }
        }
    }
}
