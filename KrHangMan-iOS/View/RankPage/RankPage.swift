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
    enum Event {
        case tappedBackButton
    }
    var container: FlexibleStackView = {
        var flexibleStackView = FlexibleStackView(ratios: [1, 1, 10], axis: .vertical)
        
        return flexibleStackView
    }()
    
    var navigationBarView: NavigationBarView = {
        
        var backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        var navigationBar = NavigationBarView(frame: .zero, title: "상위 10명", leftView: backButton)
        navigationBar.leftView = backButton
        return navigationBar
    }()
    
    var rankTableView: RankTableView = {
       var rankTable = RankTableView()
        
        return rankTable
    }()
    
    var myRankLabel: UILabel = {
       var label = UILabel()
        label.text = "나는 0000등 입니다."
        return label
    }()
    
    var eventDelegate: ((Event) -> Void)?
    
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
        
        container.appendView(1, addView: myRankLabel)
        myRankLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        container.appendView(2, addView: rankTableView)
        rankTableView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
}

extension RankPage {
    @objc func tappedBackButton() {
        print("RankPage occure tappedBackButton")
        if let eventDelegate = eventDelegate {
            eventDelegate(.tappedBackButton)
        }
    }
}
