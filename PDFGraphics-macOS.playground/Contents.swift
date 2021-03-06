import Cocoa
import Quartz// to access PDFKit
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

// macOS: PDF data is supported by NSImage
// iOS: PDF data is NOT supported by UIImage

PlaygroundPage.current.liveView = {
    let unitRect = CGRect(x: 0, y: 0, width: 256, height: 256)
    
    let imageView: NSImageView = {
        let image = NSImage(data: data)!
        let view = NSImageView(image: image)
        view.frame = unitRect
        return view
    }()
    
    let pdfView: PDFView = {
        let view = PDFView(frame: unitRect)
        guard let pdfdoc = PDFDocument(data: data) else {
            return view
        }
        view.document = pdfdoc
        return view
    }()
    let stack = NSStackView(views: [imageView, pdfView])
    stack.alignment = .centerX
    
    let view = NSView(frame: unitRect)
    view.addSubview(stack)
    view.addConstraints([
        NSLayoutConstraint(item: stack,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .left,
                           multiplier: 1, constant: 0),
        NSLayoutConstraint(item: stack,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .right,
                           multiplier: 1, constant: 0),
        NSLayoutConstraint(item: stack,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1, constant: 0),
        NSLayoutConstraint(item: stack,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1, constant: 0),
        ])
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
