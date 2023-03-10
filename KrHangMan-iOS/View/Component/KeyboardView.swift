//
//  KeyboardView.swift
//  KrHangMan-iOS-Prototype
//
//  Created by κΉνμ± on 2022/12/26.
//

import UIKit
import SnapKit

struct KeyCap: Hashable {

    enum KeyType {
        case noneKey, wordKey, shiftKey, backspaceKey, enterKey
    }
    
    let capWord: String
    let capLength: Double
    
    init(){
        self.capWord = ""
        self.capLength = 0
    }
    
    init(capWord: String, capLength:Double){
        self.capWord = capWord
        self.capLength = capLength
    }
    
    func getKeyType() -> KeyType {
        switch capWord.uppercased() {
        case "":
            return .noneKey
        case "SHIFT":
            return .shiftKey
        case "ENTER":
            return .enterKey
        case "β":
            return .backspaceKey
        default:
            return .wordKey
        }
    }
    
    func getWord() -> String {
        return capWord
    }
}

class KeyCapButton: UIButton {

    var keyCap: KeyCap
    var isUpdate: Bool = false

    override init(frame: CGRect) {
        self.keyCap = KeyCap()
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(keyCap: KeyCap) {
        self.keyCap = keyCap
        super.init(frame: .zero)
        configureButton()
    }

//    func convertShiftVersion() {
//        self.setTitle(keyCap.applyShift(), for: .normal)
//    }
    
    private func configureButton() {
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.lineBreakMode = .byClipping
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 5
        self.setTitle(keyCap.capWord, for: .normal)
    }
    
    func setInit() {
        self.isUpdate = false
        self.backgroundColor = .darkGray
    }
}

class KeyCapButtonView: UIView {
    
    enum Position {
        case none, top, middle, bottom
    }
    
    enum ShiftOnOff {
        case off, on
    }
    
    //var keyCap: KeyCap
    let keyCapButton: KeyCapButton
    let shiftKeyCapButton: KeyCapButton?
    let position: Position
    let index: Int
    
    var shiftMode: ShiftOnOff = .off
    
    override init(frame: CGRect) {
        //self.keyCap = KeyCap()
        self.keyCapButton = KeyCapButton()
        self.shiftKeyCapButton = KeyCapButton()
        self.position = .none
        self.index = 0
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(keyCap: KeyCap, shiftKeyCap: KeyCap? = nil, position: Position, index: Int) {
        //self.keyCap = keyCap
        self.keyCapButton = KeyCapButton(keyCap: keyCap)
        if let shiftKeyCap = shiftKeyCap {
            self.shiftKeyCapButton = KeyCapButton(keyCap: shiftKeyCap)
        } else {
            self.shiftKeyCapButton = nil
        }
        
        self.position = position
        self.index = index
        super.init(frame: .zero)
        configureView()
    }
    
    func convertShiftVersion() {
        if let shiftKeyCapButton = shiftKeyCapButton {
            if(shiftMode == .off) {
                shiftKeyCapButton.isHidden = false
                shiftMode = .on
            } else {
                shiftKeyCapButton.isHidden = true
                shiftMode = .off
            }
        }
    }
    
    func getKeyCap() -> KeyCap {
        return keyCapButton.keyCap
    }
    
    func getShiftKeyCap() -> KeyCap? {
        guard let shiftKeyCapButton = shiftKeyCapButton else {
            return nil
        }

        return shiftKeyCapButton.keyCap
    }
    
    private func configureView() {
        self.addSubview(keyCapButton)
        keyCapButton.snp.makeConstraints{ make in
            make.edges.equalTo(UIEdgeInsets(top: 2.5, left: 1, bottom: 2.5, right: 1))
        }
        
        if let shiftKeyCapButton = shiftKeyCapButton {
            self.addSubview(shiftKeyCapButton)

            shiftKeyCapButton.snp.makeConstraints{ make in
                make.edges.equalTo(UIEdgeInsets(top: 2.5, left: 1, bottom: 2.5, right: 1))
            }
            shiftKeyCapButton.isHidden = true
        }
    }
    
    func initKeyCapButtonView() {
        keyCapButton.setInit()
        
        if let shiftKeyCapButton = shiftKeyCapButton {
            shiftKeyCapButton.setInit()
        }
    }
}

protocol KeyboardViewDelegate {
    func touchKeyboard(keyCap: KeyCap)
}

class KeyboardView: UIStackView {
    
    var keyboardViewDelegate: KeyboardViewDelegate?
    
    let containerTopView: UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let containerMiddleView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let containerBottomView: UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let keyCapButtonDictionarys: [String: KeyCapButtonView] = ["γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 0), "γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 1), "γ·": KeyCapButtonView(keyCap: KeyCap(capWord: "γ·", capLength: 1), shiftKeyCap: KeyCap(capWord: "γΈ", capLength: 1), position: .top, index: 2), "γ±": KeyCapButtonView(keyCap: KeyCap(capWord: "γ±", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ²", capLength: 1), position: .top, index: 3), "γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 4), "γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 5),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 6),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 7),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 8),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), shiftKeyCap: KeyCap(capWord: "γ", capLength: 1), position: .top, index: 9),"β":  KeyCapButtonView(keyCap: KeyCap(capWord: "β", capLength: 1), position: .top, index: 10), "leftBlank": KeyCapButtonView(keyCap: KeyCap(capWord: "", capLength: 0.5), position: .middle, index: 0),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 1), "γ΄": KeyCapButtonView(keyCap: KeyCap(capWord: "γ΄", capLength: 1), position: .middle, index: 2),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 3),"γΉ": KeyCapButtonView(keyCap: KeyCap(capWord: "γΉ", capLength: 1), position: .middle, index: 4),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 5),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 6),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 7),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .middle, index: 8),"γ£": KeyCapButtonView(keyCap: KeyCap(capWord: "γ£", capLength: 1), position: .middle, index: 9),"rightBlank": KeyCapButtonView(keyCap: KeyCap(capWord: "", capLength: 0.5), position: .middle, index: 10),"Shift": KeyCapButtonView(keyCap: KeyCap(capWord: "Shift", capLength: 2), position: .bottom, index: 0),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .bottom, index: 1),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .bottom, index: 2),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .bottom, index: 3),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .bottom, index: 4),"γ ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ ", capLength: 1), position: .bottom, index: 5),"γ": KeyCapButtonView(keyCap: KeyCap(capWord: "γ", capLength: 1), position: .bottom, index: 6),"γ‘": KeyCapButtonView(keyCap: KeyCap(capWord: "γ‘", capLength: 1), position: .bottom, index: 7),"Enter": KeyCapButtonView(keyCap: KeyCap(capWord: "Enter", capLength: 2), position: .bottom, index: 8)]
    
    var topRowKeyCapButtons: [KeyCapButtonView] = []
    
    var middelRowCapButtons: [KeyCapButtonView] = []
    
    var bottomRowCapButtons: [KeyCapButtonView] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.distribution = .fillEqually
        self.axis = .vertical
        configureButtons()
        drawKeyboard()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureButtons() {
        keyCapButtonDictionarys.values.forEach{ [weak self] buttonView in
            let position = buttonView.position
            switch position {
            case .top:
                topRowKeyCapButtons.append(buttonView)
            case .middle:
                middelRowCapButtons.append(buttonView)
            case .bottom:
                bottomRowCapButtons.append(buttonView)
            default:
                break
            }
            
            topRowKeyCapButtons = topRowKeyCapButtons.sorted(by: {$0.index < $1.index})
            middelRowCapButtons = middelRowCapButtons.sorted(by: {$0.index < $1.index})
            bottomRowCapButtons = bottomRowCapButtons.sorted(by: {$0.index < $1.index})

            buttonView.keyCapButton.addTarget(self, action: #selector(touchKeyCapButton(_:)), for: .touchDown)
            if let shiftKeyCapButton = buttonView.shiftKeyCapButton {
                shiftKeyCapButton.addTarget(self, action: #selector(touchKeyCapButton(_:)), for: .touchDown)
            }
        }
    }
    
    func drawKeyboard() {
        drawRowKeyboard(rowKeyCaps: topRowKeyCapButtons, containerView: containerTopView)
        drawRowKeyboard(rowKeyCaps: middelRowCapButtons, containerView: containerMiddleView)
        drawRowKeyboard(rowKeyCaps: bottomRowCapButtons, containerView: containerBottomView)

    }
    
    func drawRowKeyboard(rowKeyCaps: [KeyCapButtonView], containerView: UIStackView){
        self.addArrangedSubview(containerView)
        containerView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
        }
        let rowCapLengthSum = rowKeyCaps.reduce(into: 0.0, { preResult , capButton in
            let keyCap = capButton.getKeyCap()
            return preResult += keyCap.capLength
        })
        
        rowKeyCaps.forEach{ keyCapButton in
            containerView.addArrangedSubview(keyCapButton)
            let keyCap = keyCapButton.getKeyCap()
            let capLength = keyCap.capLength
            keyCapButton.snp.makeConstraints{ make in
                make.width.equalToSuperview().multipliedBy(capLength / rowCapLengthSum)
            }
        }
    }
    
    
}

// View Function
extension KeyboardView {
    func convertShiftVersion() {
        topRowKeyCapButtons.forEach{ keycapButton in
            keycapButton.convertShiftVersion()
        }
//
//        middelRowCapButtons.forEach{ keycapButton in
//            keycapButton.convertShiftVersion()
//        }
//
//        bottomRowCapButtons.forEach{ keycapButton in
//            keycapButton.convertShiftVersion()
//        }
    }
    
    func drawUpdate(wordKey: String, status: InputWordInfo.InputStatus) {
        let wordKeyInfo = getWordKeyInfo(word: wordKey)
        let wordKey = wordKeyInfo.wordKey
        let isShiftWord = wordKeyInfo.isShiftWord
        
        guard let buttonView = keyCapButtonDictionarys[wordKey] else {
            return
        }
        
        let updateKeyButton: KeyCapButton?
        
        if(isShiftWord) {
            updateKeyButton = buttonView.shiftKeyCapButton
        } else {
            updateKeyButton = buttonView.keyCapButton
        }
        
        if let updateKeyButton = updateKeyButton, updateKeyButton.isUpdate == false {
            switch status {
            case .contain:
                updateKeyButton.backgroundColor = UIService.UIPropertyOfStatus.contain.backgroundColor
                
            case .match :
                updateKeyButton.backgroundColor = UIService.UIPropertyOfStatus.match.backgroundColor
                updateKeyButton.isUpdate = true
                
            case .miss :
                updateKeyButton.backgroundColor = UIService.UIPropertyOfStatus.miss.backgroundColor
                updateKeyButton.isUpdate = true
                
            default :
                break
            }
        }
        
//        if(!buttonView.isUpdate) {
//            switch status {
//            case .contain:
////                buttonView.keyCapButton.backgroundColor = UIService.UIPropertyOfStatus.contain.backgroundColor
//                break
//            case .match:
////                buttonView.keyCapButton.backgroundColor = UIService.UIPropertyOfStatus.match.backgroundColor
//                buttonView.isUpdate = true
//                break
//            case .miss:
////                buttonView.keyCapButton.backgroundColor = UIService.UIPropertyOfStatus.miss.backgroundColor
//                buttonView.isUpdate = true
//                break
//            default:
//                break
//            }
//        }
    }
    
    
    func getWordKeyInfo(word: String) -> (wordKey: String, isShiftWord: Bool) {
        switch word {
        case "γ":
            return ("γ" , true)
        case "γ":
            return ("γ" , true)
        case "γΈ":
            return ("γ·" , true)
        case "γ²":
            return ("γ±" , true)
        case "γ":
            return ("γ" , true)
        case "γ":
            return ("γ" , true)
        case "γ":
            return ("γ" , true)
        default :
            return (word , false)
        }
    }
    
    func initKeyboard() {
        keyCapButtonDictionarys.values.forEach{ keyCapButtonView in
            keyCapButtonView.initKeyCapButtonView()
        }
    }
}

// UI Event
extension KeyboardView {
    @objc func touchKeyCapButton(_ sender: KeyCapButton) {
        if let keyboardViewDelegate = keyboardViewDelegate {
            let keyCap = sender.keyCap
            keyboardViewDelegate.touchKeyboard(keyCap: keyCap)
        }
    }
}
