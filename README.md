# expense_tracker

# Project Report: Personal Expense Tracker App

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [UI/UX Design](#uiux-design)
4. [State Management](#state-management)
5. [Data Persistence](#data-persistence)
6. [Architecture](#architecture)
7. [Local Notifications](#local-notifications)
8. [Code Quality](#code-quality)
9. [Bonus: Multi-language Support](#bonus-multi-language-support)

## Project Overview

### App Overview
A mobile application for users to track and manage personal expenses, implemented using Flutter (version 3.19.0) and GetX for state management, following MVC architecture principles.

## Features

1. **Add Expense**: Users can input the amount, date, and a brief description.
2. **View Expenses**: Display expenses in a list, sorted and filterable by date.
3. **Edit/Delete Expense**: Modify or remove expense entries.
4. **Expense Summary**: Show summaries categorized by type, on a weekly or monthly basis.
5. **Reminder Notifications**: Set up reminders for users to record their daily expenses.
6. **User-friendly UI**: Develop a visually appealing and responsive interface.
7. **Local Data Persistence**: Use Hive for storing data locally.
8. **Clean Architecture**: Adhere to Clean Architecture principles.
9. **Local Notifications**: Implement local notifications for daily expense recording reminders.
10. **Multi-language Support** (Optional): Implement support for multiple languages.

## UI/UX Design

### Design Principles

- **User-friendly**: Simple and intuitive interface.
- **Visually appealing**: Consistent and attractive theme.
- **Responsive**: Adaptive layouts for various screen sizes.

### Screens

1. **Home Screen**: Overview of expenses and navigation to other features.
2. **Add/Edit Expense Screen**: Form for adding or editing an expense.
3. **Expense Summary Screen**: Summarized view of expenses categorized by type.


## State Management

### GetX Overview

- **Reactive Programming**: GetX makes state management simple and reactive.
- **Dependency Injection**: Easy to manage dependencies.
- **Routing**: Simplified navigation and route management.

### Implementation

1. **Controllers**: Manage the state and business logic.
2. **Bindings**: Define dependencies and inject them into the appropriate places.
3. **Views**: Interact with controllers to render the UI.



## Data Persistence

### Hive

- **NoSQL Database**: Lightweight and fast.
- **Type Adapters**: Serialize and deserialize objects.
- **Local Storage**: Data is stored locally on the device.

### Example Model

```dart
import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  double amount;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime date;

  ExpenseModel({required this.amount, required this.description, required this.date});
}
```

## Architecture

### Clean Architecture Principles

- **Presentation Layer**: Contains UI code and controllers.
- **Domain Layer**: Business logic and use cases.
- **Data Layer**: Data access and repository pattern.

### MVC Structure

- **Model**: Defines the data structure.
- **View**: Renders the UI and interacts with the user.
- **Controller**: Handles user input and updates the model/view.



## Local Notifications

### Awesome Notifications

- **Plugin**: `awesome_notifications` for local notifications.
- **Features**: Schedule, display, and manage notifications.



## Code Quality

### Best Practices

- **Clean Code**: Follow coding standards and best practices.
- **Code Reviews**: Regular code reviews to ensure quality.
- **Documentation**: Comprehensive comments and documentation.

## Bonus: Multi-language Support

### Localization

- **Package**: Getx state management provide  localization features.
- **Implementation**: Define localized strings and switch between languages.



```

## Conclusion

This project report outlines the development of a Personal Expense Tracker App using Flutter, GetX, and Hive. The app adheres to Clean Architecture principles and includes features for adding, viewing, editing, and deleting expenses, as well as summarizing expenses and setting reminders. The report also covers UI/UX design principles, state management, data persistence, unit testing, and code quality best practices, with an optional bonus for multi-language support.