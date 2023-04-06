//
//  RankListView.swift
//  KrHangMan-iOS
//
//  Created by 김태성 on 2023/03/28.
//

import Foundation
import UIKit

class RankTableView: UIView {
    var rankTable: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(TempRankTableViewCell.self, forCellReuseIdentifier: TempRankTableViewCell.identifier)
        tableView.rowHeight = 100
        return tableView
    }()
    
    override init(frame: CGRect) {
        print("RankTableView init")
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankTableView: View {
    func drawView() {
        self.addSubview(rankTable)
        rankTable.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
}


