//
//  UserCreate.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit

public struct UserCreate: Codable {
    let id: String
    let username: String
    let image: String
    let appleToken: String
    let pushToken: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case username, id, image
        case appleToken = "auth_token"
        case pushToken = "push_token"
        case createdAt = "created_at"
    }
}
