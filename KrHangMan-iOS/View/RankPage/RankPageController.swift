import UIKit
import Foundation


class RankPageController: UIViewController, Coordinating, ViewContolling {
    var coordinator: Coordinator?
    var viewModel: ViewModel?
    
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
        if let viewModel = viewModel, let viewModelEventObservable = viewModel.viewModelEvent {
            viewModelEventObservable.bind { event in
                if let event = event as? RankPageViewModel.Event {
                    self.receiveViewModelEvent(event)
                }
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
            coordinator?.eventOccurred(with: .backPage)
            
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TempRankTableViewCell.identifier, for: indexPath)
        return cell
    }    
}
