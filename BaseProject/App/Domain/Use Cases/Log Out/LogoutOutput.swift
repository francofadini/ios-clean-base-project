import Foundation

// MARK: OUTPUT BOUNDRY

protocol LogoutOutput: Boundary {
  func success(response: LogoutResponse)
  func failure(error: LoadProfileError)
}

// MARK: RESPONSE MODEL

struct LogoutResponse: ResponseModel {

}

enum LogoutError: ResponseModel {
  case other
}
