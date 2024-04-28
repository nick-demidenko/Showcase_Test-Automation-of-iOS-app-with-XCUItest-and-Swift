import XCTest

/**
 * Page Object for the pages related to the "Bible Reading" section of the application.
 */

class BibleReadingSection {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Locators to find elements
    let passageInoutFieldLocator = "Enter Bible Passage - John 3:16"
    let showVerseLocator = "Show Verse"
    let randomVerseLocator = "Random Verse"

    // Elements access methods
    var biblePassageTextField: XCUIElement {
        return app.textFields[passageInoutFieldLocator]
    }

    var showVerseButton: XCUIElement {
        return app.buttons[showVerseLocator]
    }

    var randomVerseButton: XCUIElement {
        return app.buttons[randomVerseLocator]
    }
    
    // Assertions for existance
    func testElementsForExistance(){
        biblePassageTextField.assertExistence()
        showVerseButton.assertExistence()
        randomVerseButton.assertExistence()
    }

    // Interactions on the page methods
    // Interactions with buttons
    
    func tapShowVerseButton() {
        showVerseButton.tap()
    }

    func tapRandomVerseButton() {
        randomVerseButton.tap()
    }
    
    // Complex interactions
    func findBiblePassage(_ passageCode: String, passageContent : String) {
        biblePassageTextField.tap()
        biblePassageTextField.typeText(passageCode)
        tapShowVerseButton()
        
        let verseContentPredicate = NSPredicate(format: "label CONTAINS[c] %@", passageContent)
        app.staticTexts.element(matching: verseContentPredicate).assertExistence()
    }
}
