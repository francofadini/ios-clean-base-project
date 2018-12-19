import Foundation

protocol UpdateProfileService: Service {
  func updateProfile(firstName: String,
                     lastName: String,
                     successHandler: @escaping (Profile) -> Void,
                     errorHandler: @escaping (UpdateProfileError) -> Void)
}
