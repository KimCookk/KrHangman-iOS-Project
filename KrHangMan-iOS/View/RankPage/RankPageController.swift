import UIKit
import Foundation


class RankPageController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var rankPage: RankPage = {
        var page = RankPage()
        
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPageView()
        setEvent()
    }
}

extension RankPageController {
    func setPageView() {
        view.backgroundColor = .white
        view.addSubview(rankPage)
        
        rankPage.snp.makeConstraints{ make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setEvent() {
        rankPage.rankTableView.rankTable.dataSource = self
        
    }
    
    func setPageLayer() {
        
    }
}

extension RankPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TempRankTableViewCell.identifier, for: indexPath)
        return cell
    }
}
