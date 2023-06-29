//
//  FriendsResponseModel.swift
//  DemoNetWorkingAlunMofire
//
//  Created by Vũ Đình Duẩn on 26/06/2023.
//

import Foundation
struct FriendsResponseModel : Decodable {
    var fullname : String
    var avatar : String
    var phone: String
    var nickname : String
    var id : String
    enum CodingKeyss : String, CodingKey {
        case fullname = "fullname"
        case avatar = "avatar"
        case phone = "phone"
        case nickname = "nickName"
        case id = "id"
    }
}
typealias Friends = [FriendsResponseModel]
