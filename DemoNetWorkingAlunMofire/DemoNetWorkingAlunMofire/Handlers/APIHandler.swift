//
//  APIHandler.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import Foundation
import Alamofire
// chịu trách nhiệm làm việc với API
class APIHandler {
    
    // hàm này chịu trách nhiệm gọi API lấy ra danh sách cuộc hội thoại
    func getConversations(completion: @escaping
    (Conversations) ->()) {
        AF.request("https://647df49daf984710854aad33.mockapi.io/conversations", method:
                .get).responseDecodable(of: Conversations.self) {
                    (response) in
                    if let conversationsResponse = response.value {
                        completion(conversationsResponse)
            }
        }
    }
    func getFriends(completion: @escaping
                    (Friends) ->()) {
        AF.request("https://6499b3a979fbe9bcf83fd22d.mockapi.io/Friends", method:
                .get).responseDecodable(of: Friends.self ) {
                    (response) in
                    if let FriendsResponseModel = response.value {
                        completion(FriendsResponseModel)
                    }
                }
    }
}
