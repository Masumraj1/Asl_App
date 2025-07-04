
This is a Flutter mobile application built as part of the ASL Systems Ltd.
Flutter Developer take-home assignment. The app fetches and displays products/posts 
from a remote source, with features like search, filter, pagination, add/edit/delete 
posts, and Firebase authentication integration.

---

# Features Implemented

✅ Home Screen
- Data fetched from https://dummyjson.com
- Displayed list of items with title shown in ListView
- Search and filter options implemented
- Pull-to-refresh functionality added
- Total item count displayed
- Pagination implemented for efficient loading

✅ Detail Screen
- Tapping an item navigates to a details screen showing full details (title, body)

✅ Add/Edit/Delete Screen
- Screen to add new post with form validation
- Edit existing posts functionality
- Delete posts functionality
- Data saved locally using Shared Preferences

✅ State Management
- Used GetX for state management

✅ Navigation
- Used GoRouter for declarative navigation

✅ Error & Loading Handling
- Proper loading indicators and error messages implemented
- Empty states handled gracefully

✅ Basic Theming & Responsiveness
- Responsive design tested on small and large screen sizes



## 🔄 **Migration**

- **Downgraded Flutter version to 3.0.0**, resolved compatibility issues
- **Migrated to latest stable Flutter version**
- Logged changes and issues in **MIGRATION_NOTES.md**

---

## Bonus Task

✅ **Firebase Authentication (email/password)** integrated  
✅ Successfully tested on **both Android and iOS**  
(iOS faced initial fetch problem with Firebase setup, later resolved successfully)

---

## Setup Instructions

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run` on a connected device or simulator

  ---for ios
1. cd ios
2. pod install  
3. open Runner.xcworkspace

## State Management Approach

- GetX used for reactive state management and controller separation


## 📂 **Migration Approach**

- Downgraded to Flutter 3.0.0 for backward compatibility check
- Resolved deprecated APIs and package version conflicts
- Migrated back to **latest stable Flutter version**
- Documented in **MIGRATION_NOTES.md**

---

## 🔥 **Bonus Task Completed**

- **Firebase Authentication (email/password)**


