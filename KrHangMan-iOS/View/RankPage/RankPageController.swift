import UIKit
import Foundation


class RankPageController: UIViewController, Coordinating, ViewContolling {
    var coordinator: Coordinator?
    var viewModel: ViewModel? = RankPageViewModel()
    
    var rankPage: RankPage = {
        var page = RankPage()
        
        return page
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        if let viewModel = viewModel as? RankPageViewModel {
            viewModel.reqeustTopRankInfo()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setPageLayer()
    }
}

extension RankPageController {
    
    func configureController() {
        setViewModel()
        setPageView()
        setEvent()
        setBind()
    }
    
    func setViewModel() {
        viewModel = RankPageViewModel()
    }
    
    func setPageView() {
        view.backgroundColor = .white
        view.addSubview(rankPage)
        
        rankPage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func setEvent() {
        rankPage.rankTableView.rankTable.dataSource = self
        rankPage.eventDelegate = receivePageEvent
        
    }
    
    func setBind() {
        if let viewModel = viewModel {
            viewModel.viewModelEventObservable.bind { event in
                if let event = event as? RankPageViewModel.Event {
                    self.receiveViewModelEvent(event)
                }
            }
        }
        
        if let viewModel = viewModel as? RankPageViewModel {
            
                viewModel.viewModelEventObservable.bind { event in
                    print(event)
                }
             
                viewModel.usersRankObservable.bind { usersRank in
                    print(usersRank)
                    self.rankPage.reloadRankTable()
                }
            
        }
    }
    
    func setPageLayer() {
        rankPage.drawLayer()
    }
}

extension RankPageController {
    private func receivePageEvent(_ event: RankPage.Event) {
        switch event {
        case .tappedBackButton:
            if let coordinator = coordinator {
                coordinator.eventOccurred(with: .backPage)
            }
        }
    }
    
    private func receiveViewModelEvent(_ event: RankPageViewModel.Event) {
        switch event {
        case .loading:
            break
        }
    }
}

extension RankPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel as? RankPageViewModel else {
            return 0
        }
        
        guard let count = viewModel.getUsersRankCount() else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TempRankTableViewCell.identifier, for: indexPath)
        
        guard let viewModel = viewModel as? RankPageViewModel else {
            return cell
        }
        
        guard let userRank = viewModel.getUserRank(indexPath.row) else {
            return cell
        }
        
        guard let cell = cell as? TempRankTableViewCell else {
            return cell
        }
        
        cell.setRankData(userName: userRank.userName, scoreDescription: userRank.scoreDescription, rankDescription: userRank.rankDescription)
        return cell
    }    
}
