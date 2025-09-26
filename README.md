# Shopping Cart Flutter App

A sample Flutter application demonstrating a shopping cart flow for spa services, built with [Reso Coder's Riverpod architecture](https://resocoder.com/2021/02/06/flutter-clean-architecture-features-structure-entity-domain-data-presentation-layer-tutorial/).

---

## Features

- **Riverpod State Management**: Clean separation of concerns using Application (Notifiers), Domain (Models/Abstractions), Infra (Implementations), Presentation (UI), and Shared (Providers).
- **Spa Listing**: Browse a list of spas loaded from local JSON assets.
- **Spa Details**: View detailed information and available services for each spa.
- **Cart Management**: Add or remove services to/from the cart, with cart state persisted locally.
- **Checkout Bar**: Floating checkout bar appears when the cart is not empty.
- **Location Enable Prompt**: On first launch, users are prompted to enable location (mocked, no real location fetching implemented).
- **Search**: Search spas by name, address, or category.
- **Freezed Models**: All models and states are implemented using [freezed](https://pub.dev/packages/freezed) for immutability and union types.
- **Local Storage**: Cart and location state are persisted using a local storage helper.

---

## Architecture

```
lib/
  core/
    router/           # App routing (AutoRoute)
    utils/            # Constants, helpers, etc.
    widgets/          # Shared widgets (e.g., checkout bar)
  features/
    home and cart/
      application/    # Notifiers (state management)
      domain/         # Models, abstract classes
      infra/          # Implementations (e.g., asset-based services)
      presentation/   # UI screens & widgets
      shared/         # Providers
  gen/                # Generated assets (FlutterGen)
assets/
  json/               # Mock data (spa list, spa details)
  images/             # App images
  animations/         # Lottie/GIF animations
```

---

## Getting Started

1. **Install dependencies:**

   ```sh
   flutter pub get
   ```

2. **Generate Freezed and JSON code:**

   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

---

## Notes

- **Location:**  
  The app currently uses a mock "Enable Location" dialog. No real location fetching or permissions are implemented. You can add real location logic later using packages like [`geolocator`](https://pub.dev/packages/geolocator) or [`location`](https://pub.dev/packages/location).

- **Mock Data:**  
  All spa and service data is loaded from local JSON files in `assets/json/`.

- **Persistence:**  
  Cart and location state are persisted using a simple local storage helper. For production, consider using [Hive](https://pub.dev/packages/hive) or [SharedPreferences](https://pub.dev/packages/shared_preferences).

- **Checkout Bar:**  
  The floating checkout bar appears on all pages except the cart page, and only when the cart is not empty.

- **Release Build:**  
  A release build was created using a signed `.jks` keystore and a `key.properties` file.  
  **These signing files are not included in the shared codebase** for security reasons.

---

## Useful Links

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod](https://riverpod.dev/)
- [Freezed](https://pub.dev/packages/freezed)
- [AutoRoute](https://pub.dev/packages/auto_route)

---
