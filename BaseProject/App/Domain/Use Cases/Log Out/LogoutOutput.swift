import Foundation

// MARK: OUTPUT BOUNDRY

protocol LogoutOutput: Boundary {
  func onLogoutSuccess(response: LogoutResponse)
  func onLogoutFail(error: LoadProfileError)
}

// MARK: RESPONSE MODEL

struct LogoutResponse: ResponseModel {

}

enum LogoutError {
  case other
}
