import UIKit
import SnapKit

class TempRankTableViewCell: UITableViewCell {

    static let identifier = "RankCell"

    var cellContainer: FlexibleStackView = {
        var view = FlexibleStackView(ratios: [5, 1], axis: .horizontal)
        view.backgroundColor = .white.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        return view
    }()
    
    var scoreContainer: FlexibleStackView = {
        var view = FlexibleStackView(ratios: [1, 1], axis: .vertical)
        
        return view
    }()
    
    var userNameLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 18)

        return label
    }()
    
    var scoreDescriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 25)

        return label
    }()
    
    var rankContainer: UIView = {
       var view = UIView()
        
        return view
    }()
    
    lazy var rankLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "NanumBarunGothic-YetHangul", size: 27)
        label.textAlignment = .center

        return label
    }()
    
    private var userName: String?
    private var scoreDescription: String?
    private var rank: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TempRankTableViewCell: View {
    func drawView() {
        
// Changing the translatesAutoresizingMaskIntoConstraints property of the contentView of a UITableViewCell is not supported and will result 오류 발생
//        self.contentView.snp.makeConstraints{ make in
//            make.edges.equalToSuperview()
//        }
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        contentView.addSubview(cellContainer)
        cellContainer.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(10)
        }

        cellContainer.appendView(0, addView: scoreContainer)
        scoreContainer.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        scoreContainer.appendView(0, addView: userNameLabel)
        userNameLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
        
        scoreContainer.appendView(1, addView: scoreDescriptionLabel)
        scoreDescriptionLabel.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
            
        }
        
        cellContainer.appendView(1, addView: rankContainer)
        rankContainer.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        rankContainer.addSubview(rankLabel)
        rankLabel.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

extension TempRankTableViewCell {
    
    func setRankData(userName: String, scoreDescription: String, rankDescription: String ) {
        userNameLabel.text = userName
        scoreDescriptionLabel.text = scoreDescription
        rankLabel.text = rankDescription
    }
}



