import SwiftUI

struct ImagesScreen: View {
  
  @StateObject var viewModel: ImagesViewModel = ImagesViewModel()
  
  var body: some View {
    
    Text("Images")
  }
}
