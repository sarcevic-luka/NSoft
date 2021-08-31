//
//  ActionButton.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import UIKit
import Assets

open class ActionButton: UIButton {
  public struct StyleColorDescriptor: Hashable {
    public let style: Style
    public let titleColor: UIColor
    public let backgroundColor: UIColor
    public let borderColor: UIColor
    
    public init(style: ActionButton.Style, titleColor: UIColor, backgroundColor: UIColor, borderColor: UIColor) {
      self.style = style
      self.titleColor = titleColor
      self.backgroundColor = backgroundColor
      self.borderColor = borderColor
    }
    
    public static func ==(lhs: StyleColorDescriptor, rhs: StyleColorDescriptor) -> Bool {
      lhs.style == rhs.style
    }
    
    public func hash(into hasher: inout Hasher) {
      hasher.combine(style.rawValue)
    }
  }
  
  public enum Style: Int {
    case `default` // White text, app color background, no border
    case disabled // Grayed version of default
    
    var font: UIFont {
      UIFont.boldSystemFont(ofSize: 20)
    }
    
    var borderWidth: CGFloat {
      return 2
    }
  }
  
  /// Setting the "style" through the property will not perform the operation in an animated way. Use "setStyleAnimated" in
  /// the case you'd like to set the style in an animated manner.
  open var style = Style.default {
    didSet { updateStyle(style) }
  }
  
  public var height: CGFloat = 50 {
    didSet { invalidateIntrinsicContentSize() }
  }
  
  public var referenceFont: UIFont?
  
  open override var intrinsicContentSize: CGSize {
    return CGSize(width: super.intrinsicContentSize.width, height: height)
  }
  
  open override var isEnabled: Bool {
    didSet {
      setStyleAnimated(isEnabled ? .default : .disabled, animated: true)
    }
  }
  
  open override var bounds: CGRect {
    didSet {
      layer.cornerRadius = 4
    }
  }
  
  open override var frame: CGRect {
    didSet {
      layer.cornerRadius = 4
    }
  }
  
  private static var descriptors = Set([
    ActionButton.StyleColorDescriptor(style: .default, titleColor: .white, backgroundColor: ColorAssets.General.pokeBlue.color, borderColor: .clear),
    ActionButton.StyleColorDescriptor(style: .disabled, titleColor: .white, backgroundColor: ColorAssets.General.pokeLightGray.color, borderColor: .clear)
  ])
  
  private var didSetFont = false
  
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Updating the font within any "init" triggered pathways will not update the font, 🤷‍♂️ "willMove(toSuperview:)"
  // was chosen as a good starting point for font updates. If manually setting the font, other to the one specified
  // by the current style, be sure to set the font AFTER adding the button to it's designated superview.
  open override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
    updateFontIfNeeded()
  }
}

public extension ActionButton {
  static func registerStyleColorDescriptors(_ descriptors: [StyleColorDescriptor]) {
    descriptors.forEach {
      if Self.descriptors.contains($0) {
        Self.descriptors.remove($0)
      }
    }
    Self.descriptors.formUnion(Set(descriptors))
  }
  
  func setStyleAnimated(_ style: Style, animated: Bool) {
    self.style = style
    updateStyle(style, animated: animated)
  }
}

// MARK: - Private Methods
private extension ActionButton {
  func setupViews() {
    setupView()
    updateStyle(style)
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func updateStyle(_ style: Style, animated: Bool = false) {
    guard let descriptor = Self.descriptors.first(where: { $0.style == style }) else {
      return
    }
    
    UIView.transition(with: self, duration: animated ? 0.3 : 0.0, options: [.transitionCrossDissolve], animations: {
      self.backgroundColor = descriptor.backgroundColor
      self.setTitleColor(descriptor.titleColor, for: .normal)
      self.setTitleColor(descriptor.titleColor, for: .disabled)
      self.layer.borderColor = descriptor.borderColor.cgColor
      self.layer.borderWidth = style.borderWidth
      self.updateFontIfNeeded(forceUpdate: true)
    }, completion: nil)
  }
  
  func updateFontIfNeeded(forceUpdate: Bool = false) {
    if !didSetFont || forceUpdate {
      didSetFont = true
      titleLabel?.font = referenceFont ?? style.font
    }
  }
}
