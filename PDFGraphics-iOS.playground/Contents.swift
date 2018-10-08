import UIKit
import PDFKit
import PlaygroundSupport
import PDFGraphics

let data = PDFGraphics(with: CGSize(width: 100, height: 100)) { (ctx) in
    ctx.addRect(CGRect(x: 10, y: 10, width: 80, height: 80))
    ctx.setFillColor(UIColor.green.cgColor)
    ctx.fillPath()
    
    ctx.addEllipse(in: CGRect(x: 4, y: 4, width: 40, height: 40))
    ctx.setFillColor(UIColor.red.cgColor)
    ctx.fillPath()
}

// iOS: PDF data is NOT supported by UIImage
// macOS: PDF data is supported by NSImage

PlaygroundPage.current.liveView = {
    guard let pdfdoc = PDFDocument(data: data) else {
        return nil
    }
    let view = PDFView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
    view.document = pdfdoc
    return view
}()

// If you want to export as PDF format file, do 'exports = true'.
//
// Preparation
// $ mkdir ~/Documents/Shared\ Playground\ Data/
let exports = false
if exports {
    let url = playgroundSharedDataDirectory.appendingPathComponent("pdfgraphics-sample.pdf")
    try? data.write(to: url)
}
