# README - Qunova Contact Management App

## Project Overview

Qunova is a high-performance, visually engaging Contact Management application built with Flutter. The app focuses on a premium user experience, utilizing staggered animations, reactive state management via GetX, and a clean, modern UI design. It allows users to browse contacts by category, search in real-time, and add new entries through a dynamic bottom-sheet interface.

---

## Core Features

1. Animated Splash Screen

* Features circular decorative elements that slide in from the screen corners upon launch.
* The central logo utilizes a combined Fade and Scale transition with an elastic ease-out curve for a professional "pop" effect.
* Automatically routes to the onboarding flow after a 2-second animation sequence.

2. Interactive Onboarding

* Implements a dual-animation sequence where the logo glides from the center to the top third of the screen.
* A welcome panel slides up from the bottom using a cubic easing curve.
* Provides a seamless transition into the main application.

3. Contact Home Dashboard

* Category Navigation: A horizontal list featuring photographic avatars with active-state "ring" indicators.
* Staggered List Entrances: Both categories and contact cards use indexed delays to glide into view sequentially.
* Expanding Search: The AppBar dynamically transforms into a search field using an AnimatedSwitcher.
* Pull-to-Refresh: Integrated SmartRefresher for updating contact data from the backend.

4. Contact Management

* Add Contact Sheet: A modal bottom-sheet that is keyboard-aware (resizes when the keyboard appears).
* Custom Form Fields: Includes a specialized phone input with country indicators and styled dropdowns for relationship mapping.

---

## Technical Architecture

1. Framework and State Management

* Flutter: The core UI framework.
* GetX: Used for dependency injection, reactive state updates (GetBuilder), and simplified routing.

2. Data Layer (Repository Pattern)

* ApiService: Handles low-level HTTP communication and persistent storage interactions.
* ContactRepo: Abstracts the data source, allowing the controller to request contact information without needing to know the API specifics.
* ContactController: Manages the business logic, including search filtering, category selection, and refresh states.

3. Animation System

* Implicit Animations: Used for simple layout transitions (AnimatedAlign, AnimatedPositioned).
* Explicit Animations: Used for complex sequences (AnimationController with Fade/Scale transitions).
* TweenAnimationBuilder: Utilized for high-performance staggered list effects.

---

## Folder Structure

* core/: Contains global configurations like API services and AppRoutes.
* utils/: Stores constant strings, image assets, and the AppColors theme.
* view/screens/: Contains the UI layer, separated by features (Splash, Onboarding, ContactHome).
* controller/: Contains the GetX logic for managing UI state.
* repo/: Contains the data fetching logic and API abstractions.

---

## Setup and Installation

1. Prerequisites

* Flutter SDK (Latest stable version).
* Android Studio or VS Code with Flutter extensions.

2. Steps

* Clone the repository to your local machine.
* Run "flutter pub get" to install dependencies including GetX and pull_to_refresh.
* Ensure assets are properly linked in the pubspec.yaml file under the assets/ directory.
* Run "flutter run" to launch the application on a connected device or emulator.

---

## UI Color Palette

* Primary: Emerald Green (used for buttons, active states, and branding).
* Background: Clean White/Light Grey (ensures readability and a modern aesthetic).
* Typography: Slate Grey/Charcoal (provides high contrast for contact names and headings).