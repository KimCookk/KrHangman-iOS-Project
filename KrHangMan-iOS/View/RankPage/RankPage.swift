//
//  RankPage.swift
//  KrHangMan-iOS
//
//  Created by 김태성 on 2023/03/25.
//

import Foundation
import SnapKit
import UIKit

class RankPage: UIView {
    
    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 1, 10], axis: .vertical)
        
        return flexibleStackView
    }()
    
    var navigationBarView: NavigationBarView = {
        var navigationBar = NavigationBarView(frame: .zero, title: "순위 확인")
        
        return navigationBar
    }()
    
    var myRankLabel: UILabel = {
       var label = UILabel()
        
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

extension RankPage: Page {
    func drawPage() {
        self.addSubview(container)
        container.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(0, addView: navigationBarView)
        navigationBarView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
}
