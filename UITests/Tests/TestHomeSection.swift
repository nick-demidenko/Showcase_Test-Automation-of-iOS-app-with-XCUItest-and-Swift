import XCTest

/**
 * Tests for Home Section.
 */

final class TestHomeSection: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // app.terminate()
    }
    
    func testHomaPage() throws {
        let homePage = HomeSection(app: app)
        homePage.testElementsExistence()
        NSLog("Home Section was tested succesfully.")
      }
}
