import Cocoa
import PlaygroundSupport
import PDFGraphics

let data = PDFGraphics(with: CGSize(width: 100, height: 100)) { (ctx) in
    ctx.addRect(CGRect(x: 10, y: 10, width: 80, height: 80))
    ctx.setFillColor(NSColor.green.cgColor)
    ctx.fillPath()
    
    ctx.addEllipse(in: CGRect(x: 4, y: 4, width: 40, height: 40))
    ctx.setFillColor(NSColor.red.cgColor)
    ctx.fillPath()
}

PlaygroundPage.current.liveView = {
    let image = NSImage(data: data)!
    let view = NSImageView(image: image)
    view.frame = CGRect(x: 0, y: 0, width: 256, height: 256)
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
