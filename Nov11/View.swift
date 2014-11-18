
import UIKit
import GLKit

class View: UIView {

	let littleView: LittleView;

	required init(coder aDecoder: NSCoder) {
		
		let f: CGRect = CGRectMake(170, 300, 60, 60);
		littleView = LittleView(frame: f);
		super.init(coder: aDecoder)
		backgroundColor = UIColor.blueColor();
		addSubview(littleView);
		
	}
	
	func CGContextPathContainsPoint(context: CGContext!, point: CGPoint, mode: CGPathDrawingMode) -> Bool{
	return true;
	}
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		assert(touches.count > 0);
		let touch: UITouch = touches.anyObject() as UITouch;
		let point: CGPoint = touch.locationInView(self);
		let f: CGRect = CGRectMake(point.x - 30, point.y - 30, 60, 60);
		addSubview(LittleView(frame: f));
	}

	override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
	}

	override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
	}

	override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
	}


		override func drawRect(rect: CGRect) {
		
		let screen: UIScreen = UIScreen.mainScreen();
		frame = screen.applicationFrame;
		
		let s: String = "MADAGASCAR";
		let font: UIFont = UIFont.systemFontOfSize(54);
		let foregroundColor: UIColor = UIColor.redColor();
		let attributes: [NSObject: AnyObject] = [NSFontAttributeName: font,
		NSForegroundColorAttributeName: foregroundColor];
		let applicationFrame: CGRect = screen.applicationFrame;
		let point: CGPoint = applicationFrame.origin;
		s.drawAtPoint(point, withAttributes: attributes);

		let a: [(latitude: CGFloat, longitude: CGFloat)] = [

(-25.62171595984574, 45.17578125),
(-25.562265014427492, 45.54931640625),
(-25.34402602913433, 45.966796875),
(-25.20494115356912, 46.51611328125),
(-25.244695951306028, 46.73583984375),
(-24.98605802116759, 47.13134765625),
(-24.206889622398023, 47.4609375),
(-22.004174972901993, 48.1640625),
(-17.748686651728793, 49.5703125),
(-17.35063837604883, 49.46044921875),
(-16.867633616803836, 49.72412109375),
(-16.467694748288956, 49.89990234375),
(-16.024695711685304, 49.921875),
(-15.64419660086606, 49.68017578125),
(-15.390135715305204, 49.76806640625),
(-15.58071073916211, 49.89990234375),
(-15.876809064146757, 50.07568359375),
(-16.024695711685304, 50.361328125),
(-15.32657180142083, 50.5810546875),
(-14.711134758870658, 50.25146484375),
(-13.090179355733726, 49.94384765625),
(-12.64033830684679, 49.5263671875),
(-12.726084296948184, 49.658203125),
(-12.704650508287893, 49.2626953125),
(-12.85464890558895, 48.88916015625),
(-13.304102866767074, 48.779296875),
(-13.496472765758952, 48.427734375),
(-13.85941386907402, 48.27392578125),
(-13.496472765758952, 47.96630859375),
(-13.85941386907402, 47.900390625),
(-14.562317701914843, 47.74658203125),
(-15.072123545811683, 47.52685546875),
(-14.94478487508836, 47.48291015625),
(-14.75363533154043, 47.48291015625),
(-15.050905707724771, 47.17529296875),
(-15.32657180142083, 46.6259765625),
(-15.707662769583493, 46.20849609375),
(-15.919073517982413, 45.59326171875),
(-16.109153239219467, 45.02197265625),
(-16.235772090429844, 44.71435546875),
(-16.235772090429844, 44.45068359375),
(-16.63619187839765, 44.384765625),
(-17.476432197195518, 43.92333984375),
(-18.417078658661257, 44.05517578125),
(-18.8335153964335, 44.31884765625),
(-19.186677697957833, 44.31884765625),
(-19.539084135509324, 44.47265625),
(-19.76670355171696, 44.384765625),
(-19.99399846948549, 44.40673828125),
(-20.858811790867673, 43.857421875),
(-21.28937435586041, 43.8134765625),
(-21.330315073431787, 43.48388671875),
(-21.616579336740593, 43.48388671875),
(-21.80030805097259, 43.30810546875),
(-22.471954507739213, 43.2421875),
(-23.463246331550348, 43.74755859375),
(-23.725011735951796, 43.65966796875),
(-24.327076540018634, 43.74755859375),
(-24.647017162630352, 43.96728515625),
(-25.224820176765036, 44.40673828125),
(-25.423431426334222, 44.912109375),
(-25.562265014427492, 45.54931640625)		];


		let latitude: CGFloat =   -18.04;
		let longitude: CGFloat =  46.87;

		let scale: CGFloat =  0.05 * bounds.size.height;

		let c: CGContextRef = UIGraphicsGetCurrentContext();
		CGContextBeginPath(c);

		CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);

		let radians: Float = GLKMathDegreesToRadians(Float(latitude));
		CGContextScaleCTM(c, scale * CGFloat(cos(radians)), -scale);

		CGContextTranslateCTM(c, -longitude, -latitude);

		CGContextMoveToPoint(c, a[0].longitude, a[0].latitude);
		for var i = 1; i < a.count; ++i {
			CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
		}
		CGContextClosePath(c);

		CGContextSetRGBFillColor(c, 0, 1, 0, 1);
		CGContextFillPath(c);

	}

}
