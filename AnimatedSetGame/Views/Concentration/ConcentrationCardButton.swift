

import UIKit

class ConcentrationCardButton: CardButton, NSCopying {
  
  typealias Emoji = String

  // MARK: Properties
  
  /// The concentration text emoji.
  var buttonText: Emoji? {
    didSet {
      if isFaceUp {
        setNeedsDisplay()
      }
    }
  }
  
  /// The color of the back of the card when flipped down.
  var backColor: CGColor? {
    didSet {
      if !isFaceUp {
        setNeedsDisplay()
      }
    }
  }
  
  // MARK: Imperatives
  
  override func drawFront() {
    layer.backgroundColor = UIColor.white.cgColor
    titleLabel?.font = UIFont.systemFont(ofSize: 50)
    
    if let buttonText = buttonText {
      setTitle(buttonText, for: .normal)
    }
  }
  
  override func drawBack() {
    layer.backgroundColor = backColor ?? UIColor.gray.cgColor
    setTitle(nil, for: .normal)
  }
  
  // MARK: NSCopying implementation
  
  func copy(with zone: NSZone? = nil) -> Any {
    let newCardButton = ConcentrationCardButton()
    newCardButton.frame = frame
    newCardButton.layer.backgroundColor = layer.backgroundColor
    newCardButton.isActive = isActive
    newCardButton.isFaceUp = isFaceUp
    newCardButton.backColor = backColor
    newCardButton.buttonText = buttonText
    
    return newCardButton
  }
}
