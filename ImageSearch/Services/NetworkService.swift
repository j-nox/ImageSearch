import Foundation

class NetworkService {
  
  static let shared = NetworkService()
  
  private let session: URLSession
  private let decoder: JSONDecoder
  
  private init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
    self.session = session
    self.decoder = decoder
  }
  
  func request<T>(resource: Resource<T>) async throws -> T {
    
    do {
      
      let (data, response) = try await session.data(for: resource.request)
      
      guard let response = response as? HTTPURLResponse else {
        throw AppError.network(type: .invalidResponse)
      }
      
      if response.statusCode == 401 {
        throw AppError.network(type: .unauthenticated)
      }
      
      if !(200..<300 ~= response.statusCode) {
        throw AppError.network(
          type: .custom(
            errorCode: response.statusCode,
            errorDescription: HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
          )
        )
      }
      
      return try decoder.decode(resource.responseType, from: data)
      
    } catch {
      
      if let error = error as? AppError { throw error }
      
      let error = error as NSError
      if error.domain == NSURLErrorDomain,
         error.code == NSURLErrorNotConnectedToInternet {
        throw AppError.network(type: .noInternet)
      } else if let _ = error as? DecodingError {
        throw AppError.network(type: .parsing(error: error))
      } else {
        throw AppError.network(type: .unknown(error: error))
      }
    }
  }
}
