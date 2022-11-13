import SwiftUI

struct ImagesScreen: View {
  
  @StateObject var viewModel: ImagesViewModel = ImagesViewModel()
  
  var body: some View {
    
    ScrollView {
      ForEach(viewModel.images) { image in
        
        Text(image.thumbnail)
        
      }
    }
    
  }
}
