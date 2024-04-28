import XCTest

public class Card {
  let button: XCUIElement
  let image: XCUIElement
  let title: XCUIElement

  public init(label: String, app: XCUIApplication) {
    button = app.buttons[label]
    image = button.images.firstMatch
    title = button.staticTexts.firstMatch
  }

  public func assertExistence(timeout: TimeInterval = 10, isElementStatic: Bool = false) {
    XCTContext.runActivity(named: "Assert card existence - \(button.label)") { _ in
      button.assertExistence(timeout: timeout)
      image.assertExistence(isElementStatic: isElementStatic)
      title.assertExistence(isElementStatic: isElementStatic)
    }
  }

  public func tap() {
    button.assertExistence()
    button.tap()
  }
}

extension XCUIElement {
  func assertExistence(timeout: TimeInterval = 10, isElementStatic: Bool = false) {
    if isElementStatic {
      XCTAssertTrue(self.exists, "Element is not found with")
    } else {
      XCTAssertTrue(self.waitForExistence(timeout: timeout), "Element is not found with \(timeout)s")
    }
  }
}

