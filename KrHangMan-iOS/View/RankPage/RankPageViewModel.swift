//
//  RankPageViewModel.swift
//  KrHangMan-iOS
//
//  Created by 김태성 on 2023/04/07.
//

import Foundation

class RankPageViewModel: ViewModel {
    
    enum Event {
        case loading
    }
    
    let usersRankObservable = ObservableObject<[TopRankInfo]>([])
    let eventObservable = ObservableObject<Event>(nil)
    
    init() {
        NetworkingClinet.shared.request(urlString: Constant.getURLString(.GET_RANK), httpMethod: .get, type: ResRank.self) { responseData, error in
            if let error = error {
                return
            }
            if let responseData = responseData {
                
            }
        }
    }
}

struct TopRankInfo {
    var userName: String
    var rank: String
    var scoreDescription: String
}


