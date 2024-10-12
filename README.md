# Rescue

**Rescue** is a Flutter-based mobile application designed to provide safety and assistance for women and children in emergency situations. The app features an SOS button for quickly sending real-time location to selected contacts and local police authorities. Additionally, it includes a secure emergency video recording feature that stores videos in a tamper-proof manner, accessible only by authorized professionals.

## Features

### 🚨 Emergency Button (SOS)
- The SOS button enables users to send their current location to their top contacts (set during profile creation) and local police authorities in emergencies.
- Uses real-time GPS data to ensure accurate location sharing.

### 📞 Emergency Contact List
- Users can add and manage a list of emergency contacts that can be quickly accessed during emergencies.

### 📹 Secure Emergency Video Recording
- The app allows users to record videos in dangerous situations, which are securely stored.
- The recorded video **cannot be deleted by unauthorized individuals**, ensuring that evidence is preserved.
- Only forensic or software professionals can access the stored videos for investigation.

### 🔧 Profile Setup
- Users can easily set up their profile and choose their top emergency contacts during the onboarding process.

## Getting Started

To get started with **Rescue**, follow these steps:

### Prerequisites
Ensure that you have the following installed on your local development environment:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Android/iOS emulator or a physical mobile device for testing

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/sarveshdesai/rescue.git
   ```
2. Navigate to the project directory:
   ```bash
   cd rescue
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on an emulator or connected device:
   ```bash
   flutter run
   ```

## Usage

1. **Setup Profile:** Upon first launch, you will be prompted to create your profile and add your top emergency contacts.
2. **SOS Button:** Press the SOS button in an emergency. Your real-time location will automatically be shared with selected contacts and local authorities.
3. **Emergency Video:** Use the emergency video recording feature to securely capture any suspicious or dangerous activity. The video will be stored securely, and it cannot be deleted by unauthorized individuals.

## Tech Stack

- **Flutter**: The app's user interface is built using Flutter.
- **Firebase**: For real-time database, secure storage, and location services.
- **Geolocation APIs**: To access and share the user's current location.
- **Secure Storage**: Ensures that emergency videos are stored in a tamper-proof manner.

## Contributing

We welcome contributions to improve **Rescue**. To contribute:

1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. Make your changes and commit:
   ```bash
   git commit -m 'Add your feature'
   ```
4. Push the changes to your fork:
   ```bash
   git push origin feature/YourFeature
   ```
5. Submit a pull request for review.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For inquiries or support, please reach out to the project maintainers at [your-email@example.com].

---

Thank you for using **Rescue**! Stay safe.
