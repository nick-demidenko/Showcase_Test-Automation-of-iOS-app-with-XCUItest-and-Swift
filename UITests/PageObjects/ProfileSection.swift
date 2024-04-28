import XCTest

/**
 * Page Object for the pages related to the "Profile" section of the application.
 */

class ProfileSection {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Locators to find elements
    // Locators for elements from the "Profile" page
    let personalButtonLocator = "Personal"
    let churchButtonLocator = "Church"
    
    // Locators for elements from the "My profile" page
    // Locators for text fields. Info is just displayed.
    let fullNameTextFieldLocator = "Full Name: "
    let emailTextFieldLocator = "Email: "
    let dateOfBirthButtonLocator = "Date of Birth"
    let addressTextFieldLocator = "Address: "
    let phoneTextFieldLocator = "Phone: "
    // Input fields. Info can be edited
    let fullNameInputFieldLocator = "Full Name"
    let emailInputFieldLocator = "Enter your email"
    // let dateOfBirthDatePickerLocator = "Date of Birth: "
    let addressInputFieldLocator = "Address"
    let phoneInputFieldLocator = "Phone"
    // Buttons
    let editButtonLocator = "Edit"
    let saveButtonLocator = "Save"
    let clearAllButtonLocator = "Clear All"
    
    // Locators for elements on the date picker screen
    
    
    // Element access methods
    // Buttons from the "Profile" page
    var personalButton: XCUIElement {
        return app.buttons[personalButtonLocator]
    }
    
    var churchButton: XCUIElement {
        return app.buttons[churchButtonLocator]
    }
    
    // Text fields from the "My Profile" page
    var fullNameTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", fullNameTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var emailTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", emailTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var dateOfBirthTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", dateOfBirthButtonLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var addressTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", addressTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    var phoneTextField: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", phoneTextFieldLocator)
        return app.staticTexts.element(matching: predicate)
    }
    
    // Input fields from the "Profile" page
    var fullNameInputField: XCUIElement {
        let predicate = NSPredicate(format: "placeholderValue CONTAINS %@", fullNameInputFieldLocator)
        return app.textFields.element(matching: predicate)
    }
    
    var emailInputField: XCUIElement {
        let predicate = NSPredicate(format: "placeholderValue CONTAINS %@", emailInputFieldLocator)
        return app.textFields.element(matching: predicate)
    }
    
    var dateOfBirthButton: XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", dateOfBirthButtonLocator)
        return app.buttons.element(matching: predicate)
    }
    
    var addressInputField: XCUIElement {
        let predicate = NSPredicate(format: "placeholderValue CONTAINS %@", addressInputFieldLocator)
        return app.textFields.element(matching: predicate)
    }
    
    var phoneInputField: XCUIElement {
        let predicate = NSPredicate(format: "placeholderValue CONTAINS %@", phoneInputFieldLocator)
        return app.textFields.element(matching: predicate)
    }
    
    // Buttons from the "My Profile" page.
    var editButton: XCUIElement {
        return app.buttons[editButtonLocator]
    }
    
    var saveButton: XCUIElement {
        return app.buttons[saveButtonLocator]
    }
    
    var clearAllButton: XCUIElement {
        return app.buttons[clearAllButtonLocator]
    }
    
    // Assertions for existance of elements
    // Assertions for existance of elements on the "Profile" page
    func testProfilePageButtonsForExistance(){
        personalButton.assertExistence()
        churchButton.assertExistence()
    }
    
    func testMyProfilePageViewModeElementsForExistance(){
        fullNameTextField.assertExistence()
        emailTextField.assertExistence()
        dateOfBirthTextField.assertExistence()
        addressTextField.assertExistence()
        phoneTextField.assertExistence()
        editButton.assertExistence()
        clearAllButton.assertExistence()
    }
    
    func testMyProfileEditModeElementsForExistance (){
        fullNameInputField.assertExistence()
        emailInputField.assertExistence()
        dateOfBirthButton.assertExistence()
        addressInputField.assertExistence()
        phoneInputField.assertExistence()
        saveButton.assertExistence()
        clearAllButton.assertExistence()
    }
    
    
    // Complex interactions
    func testDataEditingOnMyProfilePage
    (
        fullName: String,email: String,
        address: String, phone: String
    )
    {
        
        clearAllButton.tap()
        
        // Editing data
        fullNameInputField.tap()
        fullNameInputField.typeText(fullName)
        
        emailInputField.tap()
        emailInputField.typeText(email)
        
        addressInputField.tap()
        addressInputField.typeText(address)
        
        phoneInputField.tap()
        phoneInputField.typeText(phone)
        
        saveButton.tap()

        
        // Checking edits
        XCTAssertEqual(fullNameTextField.label,
                       fullNameTextFieldLocator +  fullName)
        XCTAssertEqual(emailTextField.label,
                       emailTextFieldLocator + email)
        XCTAssertEqual(addressTextField.label,
                       addressTextFieldLocator + address)
        XCTAssertEqual(phoneTextField.label,
                       phoneTextFieldLocator + phone)
        
        clearAllButton.tap()
    }
    
}
