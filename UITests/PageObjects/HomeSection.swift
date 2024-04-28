import XCTest

/**
 * Page Object for the pages related to the "Home" section of the application.
 */

class HomeSection {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Locators to find elements
    // Navigation tab elements
    let homeButtonLocator = "Home"
    
    // Page elements
    let homeTitleLocator = "homeView_title"
    // Page cards
    let bibleReadingCardLocator = "Bible Reading"
    let profileCardLocator = "Profile"
    let DonationCardLocator = "Donation"
    let LiveStreamCardLocator = "Live Stream"

    // Functiuons that find and return navigation panel elements
    var homeButtonElement: XCUIElement {
        return app.buttons[homeButtonLocator]
    }
    
    // Functions that find and return elements from the page
    var titleElement: XCUIElement {
        return app.staticTexts[homeTitleLocator]
    }
    
    // Functions that find and return cards from the page
    var bibleReadingCard: Card {
        return Card(label: bibleReadingCardLocator, app: app)
    }

    var profileCard: Card {
        return Card(label: profileCardLocator, app: app)
    }

    var donationCard: Card {
        return Card(label: DonationCardLocator, app: app)
    }

    var liveStreamCard: Card {
        return Card(label: LiveStreamCardLocator, app: app)
    }
    
    // Interactions on the page
    func testElementsExistence() {
        titleElement.assertExistence(isElementStatic: true)
        bibleReadingCard.assertExistence(isElementStatic: true)
        profileCard.assertExistence(isElementStatic: true)
        donationCard.assertExistence(isElementStatic: true)
        liveStreamCard.assertExistence(isElementStatic: true)
    }
    
    // Functions for navigation to other pages
    
    enum TargetPage {
        case homePage
        case bibleReadingPage
        case profilePage
        case donationPage
        case liveStreamPage
      }
    
    func navigateToPage(page: TargetPage) {
        switch page {
            case .homePage:
                openHomePage()
            case .bibleReadingPage:
                openBibleReadingPage()
            case .profilePage:
                openProfilePage()
            case .donationPage:
                openDonationPage()
            case .liveStreamPage:
                openLiveStreamPage()
        }
      }
    
    func openHomePage(){
        let button = homeButtonElement
        button.assertExistence()
        homeButtonElement.tap()
    }
    
    func openBibleReadingPage() {
        bibleReadingCard.button.tap()
    }

    func openProfilePage() {
        profileCard.button.tap()
    }

    func openDonationPage() {
        donationCard.button.tap()
    }

    func openLiveStreamPage() {
        liveStreamCard.button.tap()
    }
}
