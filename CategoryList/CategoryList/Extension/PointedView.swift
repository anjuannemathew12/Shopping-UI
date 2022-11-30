
import UIKit
@IBDesignable
class PointedView: UIView
{
    @IBInspectable
    var slopeFactor: CGFloat = 15
    {
        didSet
        {
            updatePath()
        }
    }
    
    private let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 0
        
       
        shapeLayer.fillColor = UIColor.white.cgColor
        return shapeLayer
    }()
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        updatePath()
    }
    
    private func updatePath()
    {
        let path = UIBezierPath()
        
        // Start from x = 0 but the mid point of y of the view
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        
        // Calculate the slant based on the slopeFactor
        let slantEndX = bounds.maxX * (slopeFactor / 100)
        
        // Create the top slanting line
        path.addLine(to: CGPoint(x: slantEndX, y: bounds.minY))
        
        // Straight line from end of slant to the end of the view
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        
        // Straight line to come down to the bottom, perpendicular to view
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        
        // Go back to the slant end position but from the bottom
        path.addLine(to: CGPoint(x: slantEndX, y: bounds.maxY))
        
        // Close path back to where you started
        path.close()
        
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
