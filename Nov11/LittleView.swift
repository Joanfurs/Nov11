//
//  LittleView.swift
//  Nov11
//
//  Created by Zhanna Fursova on 11/13/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

class LittleView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.greenColor();
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func drawRect(rect: CGRect)
	{
		let s = "🐒";
		let font: UIFont = UIFont.systemFontOfSize(bounds.size.height * 0.8);
		let attributes: [NSObject: AnyObject] = [NSFontAttributeName: font];
		let size: CGSize = s.sizeWithAttributes(attributes);
		let x: CGFloat = bounds.origin.x + (bounds.size.width - size.width) / 2;
		let y: CGFloat = bounds.origin.y + (bounds.size.height - size.height) / 2;
		let point: CGPoint = CGPointMake(x, y);
		s.drawAtPoint(point, withAttributes: attributes);
	}

}