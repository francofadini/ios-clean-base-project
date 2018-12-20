import Foundation

// MARK: INPUT BOUNDRY

protocol LogoutInput: Boundary {
  func logout(requestModel: LogoutRequest)
}

// MARK: REQUEST MODEL

struct LogoutRequest: RequestModel {

}
