
# Current Version
Flutter version: 3.32.0
Dart version: 3.8.0
Java version হল: 21.0.7

Gradle version: 8.4
Kotlin: 1.9.10
JVM: Java 21.0.7
OS: Mac OS X 15.5 (ARM, M1/M2 chip)
Android Gradle Plugin (AGP) version
distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip
pod --version
1.16.2




//downgrade 3.0.0

first ami fvm install dibo,ami jehetu mac use so step bye step guide this ducument
# brew tap leoafarias/fvm
# brew install fvm
# fvm install 3.0.0   ===install
# fvm use 3.0.0       ===Project এ সেই version use করো
# fvm flutter --version     ===Verify version
# fvm install stable        ==Latest stable version install করো (practice)
# fvm use stable
# fvm list                 == Installed version list দেখো




# MIGRATION_NOTES.md

## Downgrade Phase

- Downgraded Flutter version to 3.0.0 using FVM
- Updated pubspec.yaml:
    - Changed SDK constraint to ">=2.17.0 <3.0.0"
    - Downgraded dependencies to Flutter 3.0.0 compatible versions
- Faced Issues:
    - Multiple dependency version conflicts
    - Some packages required SDK >=2.18.0 which was unsupported in Flutter 3.0.0

## Migration Phase

- Upgraded Flutter to 3.32.0 (latest stable)
- Updated pubspec.yaml:
    - Changed SDK constraint to ">=3.3.0 <4.0.0"
    - Ran `flutter pub upgrade --major-versions` to update dependencies
- Fixed code warnings and errors due to package major updates
- Tested app to ensure all features work as expected

---

**End of Migration Notes**




