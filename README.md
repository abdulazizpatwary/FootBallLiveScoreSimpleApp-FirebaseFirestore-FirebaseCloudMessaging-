#  Football Live Score App(FirebaseFirestore,FirebaseCloudMessage)

A Flutter application that shows live football match scores using **Firebase Firestore** and sends notifications using **Firebase Cloud Messaging (FCM)**.

The app supports live score updates, push notifications, and navigation between screens.

---

##  Features

*  Live score update using Firebase Firestore
*  Real-time data with StreamBuilder
*  Push notification using Firebase Cloud Messaging (FCM)
*  Clean UI with ListView & ListTile
*  Slider button navigation
*  Add / Update / Delete match data
*  Running / Finished match indicator
*  Score display with team names
*  FCM Token generation & refresh

---

## 🛠 Technologies Used

* Flutter
* Dart
* Firebase Firestore
* Firebase Cloud Messaging (FCM)
* GetX Navigation
* slider_button package

---

##  Firebase Cloud Messaging

FCM service handles notifications in all app states.

### Supported states

* Foreground
* Background
* Terminated

### Functions used

```
onMessage
onMessageOpenedApp
onBackgroundMessage
getToken
onTokenRefresh
```
---



##  How it works

* App listens to Firestore using StreamBuilder
* Data converted to LiveModel
* ListView shows all matches
* Slider button navigates to next screen
* FCM sends notifications when match updates(setup done ,functionality will be added later)

---

##  Author

Abdul Aziz Patwary
Flutter Developer
