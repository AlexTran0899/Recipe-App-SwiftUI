//
//  Utillity.swift
//  RecipeListApp
//
//  Created by Alex Tran on 3/22/23.
//

import Foundation
struct Rational {
    static func gcd(_ a: Int, _ b: Int) -> Int {
      let r = a % b
      if r != 0 {
        return gcd(b, r)
      } else {
        return b
      }
    }
}
