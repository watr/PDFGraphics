# PDFGraphics

Provide convenient way to extract PDF format data from CGContext.

## As image

- macOS: PDF data is **supported** by NSImage
- iOS: PDF data is **NOT supported** by UIImage


## As data

PDFKit is also available in macOS and iOS. You can present PDF data using PDFView with PDFDocument.

- macOS: PDFKit is available but NOT as separated single module. Quartz module contains PDFKit.
- iOS: PDFKit module is available.
