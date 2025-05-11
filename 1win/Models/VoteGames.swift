

import Foundation

public struct VoteGames: Codable {
    let userId: String
    let tournamentId: Int
    let teamId: Int

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case tournamentId = "tournament_id"
        case teamId = "team_id"
    }
}
