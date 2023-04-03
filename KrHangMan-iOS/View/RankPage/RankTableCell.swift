import UIKit
import SnapKit
class TempRankTableViewCell: UITableViewCell {

    static let identifier = "RankCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        
        contentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
