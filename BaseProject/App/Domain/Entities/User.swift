import Foundation

class User {

  // MARK: ATTRIBUTES

  var identifier: Int
  var firstName: String?
  var lastName: String?

  // MARK: INITIALIZER

  init(identifier: Int, firstName: String?, lastName: String?) {
    self.identifier = identifier
    self.firstName = firstName
    self.lastName = lastName
  }

  func update(with profile: Profile) {
    self.identifier = profile.identifier
    self.firstName = profile.firstName
    self.lastName = profile.lastName
  }
}
