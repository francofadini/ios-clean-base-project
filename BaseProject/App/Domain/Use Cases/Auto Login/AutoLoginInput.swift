import Foundation

// MARK: INPUT BOUNDRY

protocol AutologinInput: Boundary {
  func autologin(requestModel: AutologinRequest)
}

// MARK: REQUEST MODEL

struct AutologinRequest: RequestModel {

}
