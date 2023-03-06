//
//  SpringButton.swift
//  SparrowCodeE2
//
//  Created by Коцур Тарас Сергійович on 05.03.2023.
//

import UIKit

final class SpringButton: UIButton {
  
  // MARK: - Properties
  
  lazy var shrinkPropertyAnimator: UIViewPropertyAnimator = makeShrinkAnimation(for: self)
  lazy var expandPropertyAnimator: UIViewPropertyAnimator = makeExpandAnimation(for: self)
  
  // MARK: - Touch methods
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    passAnimation(from: expandPropertyAnimator, to: shrinkPropertyAnimator)
    expandPropertyAnimator = makeExpandAnimation(for: self)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    
    passAnimation(from: shrinkPropertyAnimator, to: expandPropertyAnimator)
    shrinkPropertyAnimator = makeShrinkAnimation(for: self)
  }
  
  // MARK: - Private methods
  
  private func stop(animator: UIViewPropertyAnimator) -> CGFloat {
    guard animator.isRunning else { return .zero }
    let currentFraction = animator.fractionComplete
    animator.stopAnimation(true)
    animator.finishAnimation(at: .current)
    return currentFraction
  }
  
  private func passAnimation(from animator: UIViewPropertyAnimator, to nextAnimator: UIViewPropertyAnimator) {
    let completedAnimationFraction = stop(animator: animator)
    let inversedAnimationFraction = completedAnimationFraction - 1
    nextAnimator.fractionComplete = inversedAnimationFraction
    nextAnimator.startAnimation()
  }
}

extension SpringButton {
  
  private func makeExpandAnimation(for target: UIView) -> UIViewPropertyAnimator {
    let animation = UIViewPropertyAnimator(duration: Appearance.Animation.duration, curve: .easeInOut)
    animation.addAnimations {
      target.transform = .init(
        scaleX: Appearance.Animation.Expand.distortionAspectRatio,
        y: Appearance.Animation.Expand.distortionAspectRatio
      )
    }
    return animation
  }
  
  private func makeShrinkAnimation(for target: UIView) -> UIViewPropertyAnimator {
    let animation = UIViewPropertyAnimator(duration: Appearance.Animation.duration, curve: .easeInOut)
    animation.addAnimations {
      target.transform = .init(
        scaleX: Appearance.Animation.Shrink.distortionAspectRatio,
        y: Appearance.Animation.Shrink.distortionAspectRatio
      )
    }
    return animation
  }
}

private extension SpringButton {
  enum Appearance {
    enum Animation {
      static let duration: TimeInterval = 0.3
      
      enum Expand {
        static let distortionAspectRatio: CGFloat = 1.0
      }
      
      enum Shrink {
        static let distortionAspectRatio: CGFloat = 0.8
      }
    }
  }
}
