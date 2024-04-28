import Foundation
import XCTest

/**
 * Tests for Donation Section.
 */

final class TestDonationSection: XCTestCase {
    let app = XCUIApplication()
    let testData = TestData()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        //app.terminate()
    }
    
    func testDonationSection() throws {
        
        let homeSectionPageObject = HomeSection(app: app)
        homeSectionPageObject.navigateToPage(page: .donationPage)
        
        let donationSectionPageObject = DonationSection(app: app)
        donationSectionPageObject.testDonationSettingsPageElementsExistance()
        
        donationSectionPageObject.testDonationFunction()
        donationSectionPageObject.testCongratulationsPageElementsExistance()
        
        NSLog("Donation Section was tested succesfully.")
      }
}
