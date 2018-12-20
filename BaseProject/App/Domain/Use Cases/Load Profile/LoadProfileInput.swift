import Foundation

// MARK: INPUT BOUNDRY

protocol LoadProfileInput: Boundary {
  func loadProfile(requestModel: LoadProfileRequest)
}

// MARK: REQUEST MODEL

struct LoadProfileRequest: RequestModel {
  
}
