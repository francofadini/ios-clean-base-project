import Foundation

protocol LoginDatastore {
  func login(username: String, password: String, completion: (Session, DataSourceError?) -> Void)
}

class LoginInteractor: Interactor {
  typealias RequestModelType = LoginRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: LoginOutput
  private let datastore: LoginDatastore

  // MARK: INITIALIZER

  init(output: LoginOutput, datastore: LoginDatastore) {
    self.output = output
    self.datastore = datastore
  }

  // MARK: INTERACTOR

  func execute(requestModel: LoginRequest) {

  }
}

extension LoginInteractor: LoginInput {
  // MARK: CREATE ORDER INPUT
  func login(requestModel: LoginRequest) {
    
  }
}
