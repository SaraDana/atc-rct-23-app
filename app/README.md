# Dana app

Dana is an app where users can consume content, in the form of courses, track their moods, and become part of a community.
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [How install flutter](https://docs.flutter.dev/get-started/install)

## intl generate
flutter pub run intl_utils:generate

## Environments
There are 2 environments prod and dev.
It is in Android where changing environment is easy, it is something that needs to be improved.

How to change environment in android:
Open dana-app/app/android where there are 3 google-services.json files.

By default this is in prod but if you want to change to DEV copy and paste the content of google_services_dev.json in google-services.json.

And in dana-app/app/android/android/app/build.gradle you have to change the : applicationId "rcturv.dana.app".
to
"rcturv.dana.app.dev".


  

