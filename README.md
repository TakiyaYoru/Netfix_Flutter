# Netflix Clone Flutter

Ứng dụng clone Netflix được xây dựng bằng Flutter với giao diện tiếng Việt.

## 🚀 Installation

### Prerequisites
- Flutter SDK (3.0+)
- Android Studio / VS Code
- Android emulator hoặc device

### Cài đặt

1. **Clone repository:**
```bash
git clone https://github.com/TakiyaYoru/Netfix_Flutter.git
cd Netfix_Flutter
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run app:**
```bash
flutter run
```

### Dependencies

Các package được sử dụng trong `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cached_network_image: ^3.3.1
  card_swiper: ^3.0.0
  material_symbols_icons: ^4.2719.3
```

### Troubleshooting

**Lỗi build:**
```bash
flutter clean
flutter pub get
flutter run
```

**Lỗi permissions (Windows):**
- Bật Developer Mode: `start ms-settings:developers`
- Restart máy

**Lỗi dependencies:**
```bash
flutter pub upgrade
```

## 📁 Project Structure

```
lib/
├── main.dart
├── constants/app_colors.dart
├── screens/
├── models/
└── widgets/
```