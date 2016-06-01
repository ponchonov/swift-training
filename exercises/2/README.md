# Exercise #2

Create an iOS application that shows a list of your favourite bands.

## Description

- On the top right hand side of the main view is a button to add new bands.
- When that button is tapped, another view controller is displayed modally.
- The "new band view controller" has a `UITextField` instance where you can put a new band's name.
- The "new band view controler" has two navigation button items, "Cancel" to the left, and "Save" to the right.
- Tapping "Cancel" brings you back to the main view.
- Tapping "Save" saves the data somewhere, takes you back to the main view, and refreshes it.
- Swiping on a band's name reveals a "Delete" button, which upon being tapped must delete that band's name.


## Requirements
- No Storyboards/XIBs
- Use Swift
- Persist the information using `NSUserDefaults`

