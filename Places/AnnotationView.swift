//
//  AnnotationView.swift
//  Places
//
//  Created by Gerald Low on 20/10/2018.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit

//1
protocol AnnotationViewDelegate {
  func didTouch(annotationView: AnnotationView)
}

//2
class AnnotationView: ARAnnotationView {
  //3
  var titleLabel: UILabel?
  var distanceLabel: UILabel?
  var delegate: AnnotationViewDelegate?
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    loadUI()
  }
  
  //4
  func loadUI() {
    titleLabel?.removeFromSuperview()
    distanceLabel?.removeFromSuperview()
    
    let label = PaddingLabel(frame: CGRect(x: 10, y: 0, width: self.frame.size.width, height: 30))
    label.font = UIFont(name: "HelveticaNeue-Medium", size: UIFont.systemFontSize)!
    label.numberOfLines = 0
    label.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    label.textColor = UIColor.black
    label.layer.cornerRadius = 5
    label.layer.masksToBounds = true
    self.addSubview(label)
    self.titleLabel = label
    
    distanceLabel = UILabel(frame: CGRect(x: 10, y: 30, width: self.frame.size.width, height: 10))
    distanceLabel?.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    distanceLabel?.textColor = UIColor.black
    distanceLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 12)!
    distanceLabel?.layer.cornerRadius = 5
    distanceLabel?.layer.masksToBounds = true
    self.addSubview(distanceLabel!)
    
    let mid = UILabel(frame: CGRect(x: 10, y: 26, width: self.frame.size.width, height: 9))
    mid.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    self.addSubview(mid)
    
    let mid2 = UILabel(frame: CGRect(x: 10, y: 31, width: self.frame.size.width, height: 1))
    mid2.backgroundColor = UIColor(red:0.42, green:0.42, blue:0.42, alpha:1.0)
    self.addSubview(mid2) 
    
    if let annotation = annotation as? Place {
      titleLabel?.text = annotation.placeName
      titleLabel?.textAlignment = .center
      distanceLabel?.text = String(format: "%.2f km", annotation.distanceFromUser / 1000)
      distanceLabel?.textAlignment = .center
    }
  }
  //1
  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel?.frame = CGRect(x: 10, y: 0, width: self.frame.size.width, height: 30)
    distanceLabel?.frame = CGRect(x: 10, y: 30, width: self.frame.size.width, height: 20)
  }
  
  //2
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    delegate?.didTouch(annotationView: self)
  }

}
