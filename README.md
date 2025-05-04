# Project Overview

This project is a Flutter application developed with Flutter version **3.27.4**. To run this project successfully, ensure that your system has Flutter SDK **3.27.4 or higher** installed.

## Getting Started

### Prerequisites
Ensure you have the following installed:
- Flutter SDK (>= 3.27.4)
- Dart
- Android Studio or VS Code with Flutter extension
- Emulator or a physical device

### Running the Project
1. Clone the repository.
2. Open the terminal in the project directory and run:
   ```sh
   flutter pub get
   ```
3. To run the application, execute:
   ```sh
   flutter run
   ```

## Demo Video

https://github.com/user-attachments/assets/4acd5186-0104-4055-95cd-350749f2c482

## Core Functionality

Core Functionality of this project: 

- **Add a new task**
- **Edit an existing task**
- **Mark task as completed/incomplete**
- **Delete a task**
- **Filter tasks by status (All, Completed, Pending)**
- **Sort By Date**
- **Sort By Priority**
- **shared_preferences**
- **State management using Bloc**

## Code Architecture

The project follows a clean architecture approach, separating concerns into different layers. Below is an overview of the structure:

- **components/**: Contains shared widgets.
- **routes/**: Contains application routes.
- **utils/**: Contains shared utility.
- **tasks/**: Contains User Interface, state management and data.
  - **data/**: Contains the model, data source(Shared Prefernces) and the repository
  - **presentation/**: Contains **Bloc**, **Pages** and **Widgets**

### Database
**Shared Preferences** is used to store all data related to **Tasks**


## 📦 APK Download

You can download the latest APK from the [**Releases**](https://github.com/KhawajaFakhar143/rsl_task_manager_app/releases) section of this repository.

Look for the version1.0.apk under **Tags**, and download the `.apk` file attached to that release.

---

Feel free to reach out if you need any clarifications or modifications!
