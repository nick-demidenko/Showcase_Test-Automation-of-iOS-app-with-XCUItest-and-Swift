import XCTest

/**
 * Tests for Profile  Section.
 */

final class TestProfileSection: XCTestCase {
    let app = XCUIApplication()
    let testData = TestData()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        //app.terminate()
    }
    
    func testProfileSection() throws {
        let homeSectionPageObject = HomeSection(app: app)
        homeSectionPageObject.navigateToPage(page: .profilePage)
        
        let profileSectionPageObject = ProfileSection(app: app)
        profileSectionPageObject.testProfilePageButtonsForExistance()
        
        profileSectionPageObject.personalButton.tap()
        
        profileSectionPageObject.testMyProfilePageViewModeElementsForExistance()
        
        profileSectionPageObject.editButton.tap()
        
        profileSectionPageObject.testMyProfileEditModeElementsForExistance()
        
        profileSectionPageObject.testDataEditingOnMyProfilePage(
            fullName: testData.fullName,
            email: testData.email,
            address: testData.address,
            phone: testData.phone)
        
        homeSectionPageObject.navigateToPage(page: .homePage)
        NSLog("Profile Section was tested succesfully.")
      }
}
