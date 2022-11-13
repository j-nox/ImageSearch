import SwiftUI

import Foundation

class ImagesViewModel: ObservableObject {
  
  @Published var images: [ShoppingResult]  = []
  
  var queryWord: String = "City"
  var baseURL: String = "https://serpapi.com"
  
  init() {
    
    Task {
      
      guard let imagesURL = URL(string: "https://serpapi.com/search.json?q=Apple&tbm=isch&ijn=0") else {
        throw AppError.custom(errorDescription: "Wrong URL")
      }
      
      let imagesResource: Resource = Resource<ImageResponse>(url: imagesURL, httpMethod: .get)
      
      do {
        
        let imagesResponse: ImageResponse = try await NetworkService.shared.request(resource: imagesResource)
        
        DispatchQueue.main.async {
          self.images = imagesResponse.docs
        }
        
      } catch {
        throw AppError.custom(errorDescription: "Some Error")
      }
      
    }
    
  }
  
}
