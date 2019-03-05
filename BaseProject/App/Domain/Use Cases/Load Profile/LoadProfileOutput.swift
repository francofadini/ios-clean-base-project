import Foundation

// MARK: OUTPUT BOUNDRY

protocol LoadProfileOutput: Boundary {
  func onProfileLoaded(response: LoadProfileResponse)
  func onLoadProfileFail(error: LoadProfileError)
}

// MARK: RESPONSE MODEL

struct LoadProfileResponse: ResponseModel {
  let firstName: String?
  let lastName: String?
}

enum LoadProfileError: ResponseModel {
  case unauthorized
  case other
}
