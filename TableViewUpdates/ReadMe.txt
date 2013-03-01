
### Table View Animations and Gestures ###

===========================================================================
DESCRIPTION:

Demonstrates how you can use animated updates to open and close sections of a table view for viewing, where each section represents a play, and each row contains a quotation from the play. It also uses gesture recognizers to respond to user input:
* A UITapGestureRecognizer to allow tapping on the section headers to expand the section;
* A UIPinchGestureRecognizer to allow dynamic changes to the height of table view rows; and
* A UILongPressGestureRecognizer to allow press-and-hold on table view cells to initiate an email of the quotation.

================================================================================
MEMORY MANAGEMENT STYLE:

Automatic Reference Counting (ARC).

===========================================================================
BUILD REQUIREMENTS:

Xcode 4.2 or later, OS X v10.7 or later, iOS 5 or later.

===========================================================================
RUNTIME REQUIREMENTS:

OS X v10.7 or later, iOS 5 or later.

===========================================================================
PACKAGING LIST:


TableViewController.{h,m}
A table view controller to manage display of quotations from a collection of plays. The controller supports opening and closing of sections. To do this it maintains information about each section using an array of SectionInfo objects.


SectionInfo.{h,m}
A section info object maintains information about a section:
 * Whether the section is open
 * The header view for the section
 * The model objects for the section -- in this case, the dictionary containing the quotations for a single play, and the name of the play itself
 * The height of each row in the section


SectionHeaderView.{h,m}
A view to display a section header, and support opening and closing a section.


QuoteCell.{h,m}
A table view cell to display information about a quotation.
 

TVAnimationsGesturesAppDelegate.{h,m}
Application delegate: Loads information about plays and quotations stored in a property list, then creates and displays the main table view controller.


Play.{h,m}
A simple model class to represent a play with a name and a collection of quotations.


Quotation.{h,m}
A simple model class to represent a quotation with information about the character, and the act and scene in which the quotation was made.


PlaysAndQuotations.plist
A plist file that contains information about quotations made by various characters in different plays. The data is arranges as an array of "plays". Each play is a dictionary with the following keys:
@"playName": The name of the plays
@"quotations": An array of quotations

Each quotation is a dictionary with the following keys:
@"act": The act in the play in which the quotation appears
@"scene": The scene in the play in which the quotation appears
@"character": The name of the character making the quotation
@"quotation": The actual quotation


===========================================================================
CHANGES FROM PREVIOUS VERSIONS:

Version 3.0
- Updated for iOS 5 to use ARC and storyboards.

Version 1.1
- First public version.
Uses plays and quotations instead of RSS feed.
Uses SectionInfo class instead of struct.
More comments.
Minor user interface changes.

Version 1.0
- WWDC 2010 version.

===========================================================================
Copyright (C) 2010-2011 Apple Inc. All rights reserved.
