//
//  NetworkingClinet.swift
//  AlamofireExample
//
//  Created by 김태성 on 2023/02/14.
//

import Foundation
import Alamofire


// request 정리 할 필요성이 있음 중복 코드가 많은거 같음
class NetworkingClinet {
    static let shared = NetworkingClinet()
    private init() { }
    
    enum httpMetod {
        case get, post, patch, none
    }
    
    
    func requestURLImage(imageURL: String, completion: @escaping (UIImage?) -> Void) {
        AF.request(imageURL, method: .get).response { responseData in
            switch responseData.result {
            case let .success(data):
                if let data = data {
                    completion(UIImage(data: data, scale:1))
                }
                
            case let .failure(error):
                completion(nil)
            }
         }
    }
    
    // 파라미터 존재하지 않는 경우
    func request<Output: Decodable>(urlString: String, httpMethod: HTTPMethod, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> Void) {
        AF.request(urlString, method: httpMethod).response { responseData in
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }
    
    func request<Output: Decodable>(urlString: String, httpMethod: HTTPMethod, headers: HTTPHeaders, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> Void) {
        
        AF.request(urlString, method: httpMethod, headers: headers).response { responseData in
            debugPrint(responseData)
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }
    
    func request<Output: Decodable>(urlString: String, pathVariable: [String] ,httpMethod: HTTPMethod, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> Void) {
        var urlString = urlString
        print("request urlString: \(urlString)")
        pathVariable.forEach { variable in
            urlString += "/\(variable)"
        }
        print("AF Request")
        AF.request(urlString, method: httpMethod).response { responseData in
            debugPrint(responseData)
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }
    
    func request<Output: Decodable>(urlString: String, httpMethod: HTTPMethod, type: Output.Type, headers: HTTPHeaders, completion: @escaping ((String?, Output?)?, Error?) -> Void) {
        
        print("request urlString: \(urlString)")
        print("AF Request")
        AF.request(urlString, method: httpMethod).response { responseData in
            debugPrint(responseData)
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }

    // 파라미터가 존재하는 경우
    func request<Input: Encodable, Output: Decodable>(urlString: String, httpMethod: HTTPMethod, parameter: Input, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> ()) {
        
        AF.request(urlString, method: httpMethod, parameters: parameter, encoder: .json()).response { responseData in
            debugPrint(responseData)
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }
    
    
    func request<Input: Encodable, Output: Decodable>(urlString: String, httpMethod: HTTPMethod, parameter: Input, headers: HTTPHeaders, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> ()) {
        
        AF.request(urlString, method: httpMethod, parameters: parameter, encoder: .json(), headers: headers).response { responseData in
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(1)
        }
    }
    
    private func decodeData<Output: Decodable>(_ type: Output.Type, data: Data?) throws -> Output? {
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let decodingData = try decoder.decode(type, from: data)
            return decodingData
        }
        catch {
            return nil
        }
    }
    
}

