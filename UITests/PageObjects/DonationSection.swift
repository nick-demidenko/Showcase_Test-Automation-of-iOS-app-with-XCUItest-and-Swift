import XCTest

/**
 * Page Object for the pages related to the "Donation" section of the application.
 */

class DonationSection {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Locators to find elements
    // Locators for elements from the page with donation settings
    let totalAmountTextFieldLocator = "Total Amount: "
    let oneDollarButtonLocator = "$1"
    let fiveDollarsButtonLocator = "$5"
    let quantityTextFieldLocator = "Quantity: "
    let plusButtonLocator = "Increment"
    let minusButtonLocator = "Decrement"
    let totalTextFieldLocator = "Total: "
    let donateButtonLocator = "Donate"
    
    // Locators for elements on the "Congratulations!" page.
    let congradulationsTextFieldlocator = "Congratulations!"
    let thankYouButtonLocator = "Thank you!"
    
    // Element access methods
    // Buttons from the page with donation settings
    // Text fields from the "My Profile" page
    var totalAmountTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", totalAmountTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var oneDollarButton: XCUIElement {
        return app.buttons[oneDollarButtonLocator]
    }
    
    var fiveDollarsButton: XCUIElement {
        return app.buttons[fiveDollarsButtonLocator]
    }
    
    var quantityTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", quantityTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var plusButton: XCUIElement {
        return app.buttons[plusButtonLocator]
    }
    
    var minusButton: XCUIElement {
        return app.buttons[minusButtonLocator]
    }
    
    var totalTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", totalTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var donateButton: XCUIElement {
        return app.buttons[donateButtonLocator]
    }
    
    var congradulationsTextField: XCUIElement {
        return app.staticTexts[congradulationsTextFieldlocator]
    }
    
    var thankYouButton: XCUIElement {
        return app.buttons[thankYouButtonLocator]
    }
    
    // Assertions for existance of elements
    // Assertions for existance of elements on the page with donation settings
    func testDonationSettingsPageElementsExistance(){
        totalAmountTextField.assertExistence()
        oneDollarButton.assertExistence()
        fiveDollarsButton.assertExistence()
        quantityTextField.assertExistence()
        plusButton.assertExistence()
        minusButton.assertExistence()
        totalTextField.assertExistence()
        donateButton.assertExistence()
    }
    
    func testCongratulationsPageElementsExistance(){
        congradulationsTextField.assertExistence()
        thankYouButton.assertExistence()
    }
    
    // Complex interactions
    func testDonationFunction
    ()
    {
        oneDollarButton.tap()
        fiveDollarsButton.tap()
        plusButton.tap()
        plusButton.tap()
        
        XCTAssertEqual(totalAmountTextField.label,
                       totalAmountTextFieldLocator + "$6,00")
        XCTAssertEqual(quantityTextField.label,
                       quantityTextFieldLocator + "2")
        XCTAssertEqual(totalTextField.label,
                       totalTextFieldLocator + "$12,00")
        
        donateButton.tap()
    }
}
