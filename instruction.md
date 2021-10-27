Before release
a. Check for hardocded values
Ex: 
//! 1 Hardcoded


1. flutter format .
2. Run fix import command
3. Re-organise all imports
4. flutter attach --app-id com.unicity.dsctool

flutter pub run build_runner build --delete-conflicting-outputs

Fatlane
bundle exec fastlane match development 
bundle exec fastlane android_beta_app
