import Foundation
import UIKit

class GamePage: UIView {
    // 수정이 필요
    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 1, 10], axis: .vertical)
        
        return flexibleStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawPage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GamePage: Page {
    func drawPage() {
        
    }
}
