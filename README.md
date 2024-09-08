
# Restaurant List App

A simple Flutter app that displays a list of restaurants with a search functionality, utilizing `Riverpod` for state management.

## Features

- **Restaurant Listing**: Displays a list of restaurants.
- **Search Functionality**: Users can search for restaurants in the list by name.
- **State Management**: Utilizes `Riverpod` to manage the state of the restaurant data and search input.
- **Async Data Handling**: Asynchronously fetches and displays restaurant data, with loading and error handling.

## Getting Started

### Prerequisites

To run this project, you will need:

- Flutter SDK (version 3.5.2 or higher)
- Dart (version 3.0.0 or higher)

Make sure Flutter and Dart are properly installed. You can verify your Flutter installation by running:

```bash
flutter doctor
```

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/restaurant-list-app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd restaurant-list-app
    ```

3. Fetch dependencies:

    ```bash
    flutter pub get
    ```

### Running the App

You can run the app on a connected device or emulator by executing:

```bash
flutter run
```

### Project Structure

```
lib/
│
├── main.dart                # Main entry point of the application
├── providers/
│   └── restaurant_provider.dart  # Riverpod providers for restaurant data and search input
├── models/
│   └── restaurant.dart      # (Optional) Model class for restaurant objects
├── assets/
│   └── restaurants.json     # JSON file containing the list of restaurants
```

### Key Files

- **main.dart**: The main file that initializes the app and sets up the UI for displaying restaurants.
- **restaurant_provider.dart**: Contains the `StateNotifier` and `FutureProvider` logic for managing the list of restaurants and the search query.

## Dependencies

- **Flutter**: The UI toolkit for building natively compiled apps for mobile, web, and desktop.
- **Riverpod**: A state management library that offers a declarative approach to handle state changes.
- **cupertino_icons**: A set of icons from Apple for iOS development.

### Pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.0.0
  cupertino_icons: ^1.0.8
```

## Usage

- Launch the app and you’ll see a list of restaurants fetched from a local `restaurants.json` file.
- Use the search bar at the top of the screen to filter the list of restaurants in real-time.
- If the data is still loading, a circular progress indicator will be shown, and if there is an error fetching the data, an error message will appear.

## Assets

The project includes a `restaurants.json` file located in the `assets/` folder. This file contains mock data for restaurants and is used to populate the list.

### Example `restaurants.json` format

```json
[
  "Pasta Place",
  "Burger Town",
  "Sushi House",
  "Taco Stop"
]
```