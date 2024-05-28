//
//  DetailsView.swift
//  AppleFrameworks
//
//  Created by Maja on 20/05/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    let needsXButton: Bool
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            if needsXButton {
                XDismissButton(isShowing: $isShowingDetailView)
            }

            Spacer()
            
            FrameworkTitleView(framework: framework, imageSize: 150, horizontal: false)
            ScrollView {
                Text(framework.description)
                    .padding()
                    .font(.body)
            }
            
            Spacer()
            
            Button{
                isShowingSafariView = true
            } label: {
                LearnMoreButton(title: "Learn More")
                    .padding()
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
         }
        .background(Gradient(colors: [.black, Color(UIImage(named: framework.imageName)?.findAverageColor() ?? .clear)]))
    }
}

//source: https://christianselig.com/2021/04/efficient-average-color/
extension UIImage {
    func findAverageColor() -> UIColor? {
        guard let cgImage = cgImage else { return nil }
        
        let size = CGSize(width: 40, height: 40)
        
        let width = Int(size.width)
        let height = Int(size.height)
        let totalPixels = width * height
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
        
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4, space: colorSpace, bitmapInfo: bitmapInfo) else { return nil }

        context.draw(cgImage, in: CGRect(origin: .zero, size: size))

        guard let pixelBuffer = context.data else { return nil }
        
        let pointer = pixelBuffer.bindMemory(to: UInt32.self, capacity: width * height)

        var totalRed = 0
        var totalBlue = 0
        var totalGreen = 0
        
        for x in 0 ..< width {
            for y in 0 ..< height {
                // pixels stored as one long row
                let pixel = pointer[(y * width) + x]
                
                let r = red(for: pixel)
                let g = green(for: pixel)
                let b = blue(for: pixel)

                totalRed += Int(r)
                totalBlue += Int(b)
                totalGreen += Int(g)
            }
        }
        
        let averageRed = CGFloat(totalRed) / CGFloat(totalPixels)
        let averageGreen = CGFloat(totalGreen) / CGFloat(totalPixels)
        let averageBlue = CGFloat(totalBlue) / CGFloat(totalPixels)
        
        return UIColor(red: averageRed / 255.0, green: averageGreen / 255.0, blue: averageBlue / 255.0, alpha: 1.0)
    }
    
    private func red(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 16) & 255)
    }

    private func green(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 8) & 255)
    }

    private func blue(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 0) & 255)
    }
}


#Preview {
    FrameworkDetailView(framework: MockData.frameworks[0], needsXButton: false, isShowingDetailView: .constant(false))
}

#Preview {
    FrameworkDetailView(framework: MockData.frameworks[3], needsXButton: true, isShowingDetailView: .constant(false))
}
