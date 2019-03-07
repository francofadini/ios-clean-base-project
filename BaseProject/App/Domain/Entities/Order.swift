import Foundation

class Order: Codable {

  // MARK: PRIVATE ATTRIBUTES

  let identifier: String
  var firstName: String?

  // MARK: INITIALIZER

  init(identifier: String, firstName: String?) {
    self.identifier = identifier
    self.firstName = firstName
  }
}
