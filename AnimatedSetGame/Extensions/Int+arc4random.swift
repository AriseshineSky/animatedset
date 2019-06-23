

import Foundation

extension Int {
  
  /// A facility property for accessing a random
  /// value from the current Int instance.
  var arc4random: Int {
    return Int(arc4random_uniform(UInt32(self)))
  }
}
