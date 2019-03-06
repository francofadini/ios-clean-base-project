import Foundation

/**
 A Service is responsable for a very specific reusable task,
 not only for performing API requests calls,
 but also for some local storage, or computer processing, etc
*/

protocol Service {

}

enum ServiceResponseStatus {
  case success
  case fail
}
