# flutter_getx_template

A new Flutter project.

## Generating Scripts

Generate `.g.dart` files

```
flutter pub run build_runner build --delete-conflicting-outputs
```

Generate localization file (`lib/common/translations/locale_keys.g.dart`)
```
flutter pub run easy_localization:generate -f keys -S ./assets/translations -O ./lib/common/translations -o locale_keys.g.dart
```
