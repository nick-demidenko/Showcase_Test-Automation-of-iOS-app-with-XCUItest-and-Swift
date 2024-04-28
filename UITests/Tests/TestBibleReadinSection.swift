import XCTest

/**
 * Tests for Bible Reading Section.
 */

final class TestbibleReadingSection: XCTestCase {
    let app = XCUIApplication()
    let testData = TestData()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testBibleReadingSection() throws {
        let homeSectionPageObject = HomeSection(app: app)
        homeSectionPageObject.navigateToPage(page: .bibleReadingPage)
        
        let bibleReadingSectionPageObject = BibleReadingSection(app: app)
        bibleReadingSectionPageObject.testElementsForExistance()
        
        bibleReadingSectionPageObject.findBiblePassage(testData.verseCode,
                                          passageContent: testData.verseContent)
        
        homeSectionPageObject.navigateToPage(page: .homePage)
        NSLog("Bible Reading Section was tested succesfully.")
      }
}
