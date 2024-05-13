import Foundation
import JWTTokenValidator
import JWTKit

protocol MyProtocol {
    associatedtype T where T: JWTPayload
    var payload: T {get set}
}

class JWTTokenValidatorViewModel: ObservableObject {
    private let key: String
    @Published var error: Error?
    @Published var token: String?
    
    init(key: String) {
        self.key = key
    }
    
    func verify<T: JWTPayload>(token: String, digestAlgorithm: DigestAlgorithm, type: T.Type) async throws -> T? {
        let validator = JWTTokenValidator(key: key)
        return try await validator.verify(token, digestAlgorithm: digestAlgorithm, type: type)
    }
    
    func createToken(payload: JWTPayload, digestAlgorithm: DigestAlgorithm) {
        Task {
            do {
                let validator = JWTTokenValidator(key: key)
                token = try await validator.createToken(payload: payload, digestAlgorithm: digestAlgorithm)
            } catch {
                self.error = error
            }
        }
    }
}
