

import UIKit
extension UIView {
    func roundCornersWithRect(rect:CGRect, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setShadow(color:UIColor = .black, offset: CGSize = CGSize(width: 0.0, height: 5.0), radius: CGFloat = 2.0 , opacity: Float = 0.5){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    func setShadowforView() {
        layer.masksToBounds = false
        clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        layer.shouldRasterize = false
    }
    func scatteredShadow() {
        layer.masksToBounds = false
        layer.shadowColor = backgroundColor!.cgColor
        layer.shadowOffset = .zero
        let shadowSize: CGFloat = 20
        let contactRect = CGRect(x: -shadowSize/2, y: frame.height - (shadowSize), width: frame.width + shadowSize , height: shadowSize * 2)
        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
    }
    
    func roundedImageView(radius: CGFloat) {
        setRoundedCorner(radius: radius)
    }

    func setRoundedCorner(radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(width: CGFloat = 1.0, color: UIColor, cornerRadius: CGFloat = 0.0)  {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    func setDashedBorder(width: CGFloat = 1.0, color: UIColor, cornerRadius: CGFloat = 0.0)  {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        shapeLayer.bounds = shapeRect
        shapeLayer.name = "DashBorder"
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = [13,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        self.layer.masksToBounds = false
        self.layer.addSublayer(shapeLayer)
    }
    func addDashedLineBorder() {
        let color = UIColor.black.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = (self.frame.size)
        let shapeRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [4,4]
        shapeLayer.path = UIBezierPath(rect: shapeRect).cgPath

        self.layer.addSublayer(shapeLayer)
    }
    func setGradientBackground(topColor: UIColor = .white, bottomColor: UIColor = UIColor(named: "Theme-Blue")!) {
        let gradient = CAGradientLayer()

        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
    func setGradientViewBackground(topColor: UIColor = .clear, bottomColor: UIColor = .white) {
        
        let gradient = CAGradientLayer()

        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
    
    func drawTriangle(size: CGFloat, x: CGFloat, y: CGFloat, up:Bool) {

        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        trianglePath.move(to: .zero)
        trianglePath.addLine(to: CGPoint(x: -size, y: up ? size : -size))
        trianglePath.addLine(to: CGPoint(x: size, y: up ? size : -size))
        trianglePath.close()
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor.white.cgColor
        triangleLayer.anchorPoint = .zero
        triangleLayer.position = CGPoint(x: x, y: y)
        triangleLayer.name = "triangle"
        self.layer.addSublayer(triangleLayer)
    }
    func setCornerGradientBackground(topColor: UIColor = #colorLiteral(red: 0.0365074724, green: 0.6952297688, blue: 0.6510275006, alpha: 0.5), bottomColor: UIColor = #colorLiteral(red: 0.7601570487, green: 0.8452833295, blue: 0.9180312157, alpha: 1)){
 
        
        let g1 = CAGradientLayer()
        g1.frame = bounds
        g1.colors = [UIColor.white.cgColor, topColor.cgColor, bottomColor.cgColor, UIColor.white.cgColor]
        g1.locations = [0, 0.25, 0.75, 1]
        g1.startPoint = CGPoint(x: 1, y: 0)
        g1.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(g1, at: 0)
         
        
        let g2 = CAGradientLayer()
        g2.frame = bounds
        g2.colors = [UIColor.clear.cgColor , UIColor.white.cgColor]
        g2.locations = [0, 1]
        layer.insertSublayer(g1, at: 0)
    }
    func setGradientBackground(colors:[ CGColor] , locations: [NSNumber], start:CGPoint,end:CGPoint,frame:CGRect){
 
        
        let g1 = CAGradientLayer()
        g1.frame = frame
        g1.colors = colors
        g1.locations = locations
        g1.startPoint = start
        g1.endPoint = end
        layer.insertSublayer(g1, at: 0)

    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
}

