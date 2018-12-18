import Foundation

class Order: Codable {

  // MARK: PRIVATE ATTRIBUTES

  let identifier: Int
  let firstName: String?

  // MARK: INITIALIZER

  init(identifier: Int, firstName: String) {
    self.identifier = identifier
    self.firstName = firstName
  }
}
