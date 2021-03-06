import Foundation

class Session {

  // MARK: ATTRIBUTES

  let token: String
  let user: User

  // MARK: INITIALIZER

  init(token: String, user: User) {
    self.token = token
    self.user = user
  }

  func updateUser(with profile: Profile) {
    self.user.update(with: profile)
  }
}
