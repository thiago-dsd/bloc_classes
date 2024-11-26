# Flutter Bloc Study

This repository contains files and practical examples for studying the **Bloc** library, widely used in Flutter application development. The goal is to provide a detailed and practical understanding of this library, which simplifies the implementation of the BLoC (Business Logic Component) pattern for state management in Flutter projects.

## About Bloc

The **Bloc** library is a powerful state management solution for Flutter. It helps developers separate business logic from UI, ensuring a more maintainable, testable, and scalable codebase. Bloc achieves this by using **Streams** and **Events** to handle state changes efficiently. 

### Key Features:
- **Separation of Concerns**: Keeps UI and business logic independent.
- **Scalability**: Ideal for handling complex state management scenarios.
- **Testability**: Easily test business logic independently of the UI.
- **Reactive Programming**: Uses Streams to manage asynchronous data flows.

Learn more about the library in the [official Bloc documentation](https://bloclibrary.dev).

## Repository Structure

- `counter`: A basic counter app to demonstrate the Bloc pattern.
- `switch`: A simple switch showcasing state transitions and event handling.
- `todo`: A task management application where users can add, remove, and mark tasks as complete, demonstrating the use of Bloc for state management and event-driven updates.
- `favorite`: A favorite management application where users can add items to their favorites, toggle their favorite status, and filter favorite items, showcasing state transitions and event-driven logic with Bloc.
- `image_picker`: An image picker that allows users to select a photo from the gallery or capture a new one using the camera, handling the states and events related to image selection.
- `posts`: A basic CRUD for posts. Focused on data manipulation and simple user interaction.


## Prerequisites

Before diving into the examples, ensure you have the following installed:
- Flutter SDK (latest version)
- Dart
- A basic understanding of Flutter development

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/flutter-bloc-study.git
2. Run project
    ```bash
    flutter run
