//
//  FlexibleStackView.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/05.
//

import Foundation
import UIKit
import SnapKit

// 화면을 비율을 설정할 수 있게끔...

class FlexibleStackView: UIStackView {
    
    var stackUnitViews: [FlexibleStackUnitView] = []
    var totalRatio = 0.0
    
    convenience init(ratios: [Double], axis: NSLayoutConstraint.Axis? = nil) {
        self.init()
        if let axis = axis {
            self.axis = axis
        }
        
        ratios.forEach{ ratio in
            let stackUnitView = FlexibleStackUnitView(ratio: ratio)
            stackUnitViews.append(stackUnitView)
        }
        self.totalRatio = ratios.reduce(0.0, +)
        self.distribution = .fill
        
        configureView()
    }
    
    func appendView(_ index: Int, addView: UIView) {
        guard stackUnitViews.count >= index + 1 else {
            return
        }
        stackUnitViews[index].addSubview(addView)
    }
}

extension FlexibleStackView: ViewAble {
    func configureDraw() {
        stackUnitViews.forEach{ stackUnitView in
            self.addArrangedSubview(stackUnitView)
            stackUnitView.snp.makeConstraints{ make in
                if(self.axis == .vertical) {
                    make.width.equalToSuperview()
                    make.height.equalToSuperview().multipliedBy(stackUnitView.ratio / totalRatio )
                }
                else {
                    make.height.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(stackUnitView.ratio /  totalRatio )
                }
            }
        }
    }
    
    func configureEvent() {
        
    }
}

class FlexibleStackUnitView: UIView {
    var ratio: Double = 0.0
    
    convenience init(ratio: Double) {
        self.init()
        self.ratio = ratio
       
        self.backgroundColor = UIColor.getRandom()
    }
}


