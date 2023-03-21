//
//  Extension+.swift
//  KrHangMan-iOS
//
//  Created by 김태성 on 2023/03/20.
//

import Foundation
import UIKit

extension UIColor {
    static func getRandom() -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
                
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
