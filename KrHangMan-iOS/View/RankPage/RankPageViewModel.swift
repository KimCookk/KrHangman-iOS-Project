//
//  RankPageViewModel.swift
//  KrHangMan-iOS
//
//  Created by 김태성 on 2023/04/07.
//

import Foundation

class RankPageViewModel: ViewModel {
    var viewModelEventObservable: ObservableObject<ViewModelEvent> = ObservableObject<ViewModelEvent>(nil)
    
    enum Event: ViewModelEvent {
        case loading
    }
    
    let usersRankObservable: ObservableObject<[TopRankInfo]> = ObservableObject<[TopRankInfo]>([])
    
    func reqeustTopRankInfo() {
        NetworkingClinet.shared.request(urlString: Constant.getURLString(.GET_RANK), httpMethod: .get, type: ResRank.self) { responseData, error in
            if let error = error {
                return
            }
            if let responseData = responseData, let resRank = responseData.1 {
                self.usersRankObservable.value = resRank.addRank.map { rank in
                    return TopRankInfo(userName: rank.username, rank: "\(rank.ranking)", score: "\(rank.correctCnt)")
                }
            }
        }
    }
    
    func getUsersRankCount() -> Int? {
        guard let value = usersRankObservable.value else {
            return nil
        }
        return value.count
    }
    
    func getUserRank(_ index: Int) -> TopRankInfo? {
        guard let value = usersRankObservable.value else {
            return nil
        }
        
        guard value.count >= index else {
            return nil
        }
        
        return value[index]
    }
    
}

struct TopRankInfo {
    var userName: String
    var rank: String
    var score: String
    
    var scoreDescription: String {
        return "총 \(score) 문제 성공!!"
    }
    
    var rankDescription: String {
        return "\(rank)등"
    }
}


