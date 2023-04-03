//
//  UIService.swift
//  KrHangMan-iOS-Prototype
//
//  Created by 김태성 on 2022/12/26.
//

import Foundation
import UIKit

class UIService: ServiceAble {
    
    static func getBackgroundImg(_ backgroundView: UIView) -> UIImage {
        if let uiImage = UIImage(named: "background.jpeg") {
            UIGraphicsBeginImageContext(backgroundView.frame.size)
            uiImage.draw(in: backgroundView.bounds, blendMode: .lighten, alpha: 0.3)
        }
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return backgroundImage
    }
    
    static func setGrayRoundStyleButton(_ button: UIButton) {
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        if let titleLabel = button.titleLabel {
            titleLabel.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 25)
        }
        button.layer.shadowColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.setTitleColor(.white, for: .normal)
    }
    
    func getBackgroundImg(_ backgroundView: UIView) -> UIImage {
        if let uiImage = UIImage(named: "background.jpeg") {
            UIGraphicsBeginImageContext(backgroundView.frame.size)
            uiImage.draw(in: backgroundView.bounds, blendMode: .lighten, alpha: 0.3)
        }
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return backgroundImage
    }
    
    func getHelpImg(_ backgroundView: UIView) -> UIImage {
        if let uiImage = UIImage(named: "helpPopup.png") {
            UIGraphicsBeginImageContext(backgroundView.frame.size)
            uiImage.draw(in: backgroundView.bounds, blendMode: .lighten, alpha: 1)
        }
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return backgroundImage
    }
    
    func getUIPropertyOfStatus(_ status: UIPropertyOfStatus) -> UIPropertyOfStatus {
        return status
    }
    
    enum UIPropertyOfStatus {
        case empty, input, match, contain, miss
        
        var backgroundColor: UIColor {
            switch self {
            case .empty:
                return .white
            case .input:
                return .white
            case .match:
                return UIColor(red: 73/255, green: 182/255, blue: 117/255, alpha: 1)
            case .contain:
                return UIColor(red: 255/255, green: 159/255, blue: 64/255, alpha: 1)
            case .miss:
                return .lightGray
            }
        }
        
        var boarderColor: CGColor {
            switch self {
            case .empty:
                return UIColor.lightGray.cgColor
            case .input:
                return UIColor.darkGray.cgColor
            case .match:
                return UIColor(red: 73/255, green: 182/255, blue: 117/255, alpha: 1).cgColor
            case .contain:
                return UIColor(red: 255/255, green: 159/255, blue: 64/255, alpha: 1).cgColor
            case .miss:
                return UIColor.lightGray.cgColor
            }
        }
    }
}
