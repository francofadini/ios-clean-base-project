import Foundation

protocol UpdateProfileService: Service {
  func updateProfile(identifier: Int,
                     firstName: String,
                     lastName: String,
                     successHandler: @escaping (Profile) -> Void,
                     errorHandler: @escaping (UpdateProfileServiceError) -> Void)
}

enum UpdateProfileServiceError {
    case noInternet
    case unauthorized
    case other
}
