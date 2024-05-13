//
//  Payload.swift
//  JWTTokenValidatorExample
//
//  Created by Thomas (privat) Leonhardt on 13.05.24.
//

import JWTKit

struct PayloadModel: JWTPayload {
    var url: SubjectClaim
    var exp: ExpirationClaim

    func verify(using key: some JWTAlgorithm) throws {
        try self.exp.verifyNotExpired()
    }
}
