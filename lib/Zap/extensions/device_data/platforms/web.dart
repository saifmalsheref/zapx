// ignore_for_file: unused_element, avoid_web_libraries_in_flutter

import 'dart:html' as html;

/// Class providing information specific to a web environment (browser).
class ZapWebInfo {
  /// Gets the current location.
  Future<Location> get location => Location().getCurrentLocation();

  /// Gets the platform of the browser.
  String? get platform => html.window.navigator.platform;

  /// Gets whether cookies are enabled in the browser.
  bool? get cookieEnabled => html.window.navigator.cookieEnabled;

  /// Gets the amount of device memory in gigabytes.
  num? get deviceMemory => html.window.navigator.deviceMemory;

  /// Gets the user agent string.
  String? get userAgent => html.window.navigator.userAgent;

  /// Gets the application version.
  String? get appVersion => html.window.navigator.appVersion;

  /// Gets the language of the browser.
  String? get language => html.window.navigator.language;

  /// Gets a list of preferred languages set in the browser.
  List<String>? get languages => html.window.navigator.languages;

  /// Gets the inner width of the browser window.
  int? get innerWidth => html.window.innerWidth;

  /// Gets the inner height of the browser window.
  int? get innerHeight => html.window.innerHeight;

  /// Displays an alert with the specified [message].
  void showAlert(String message) => html.window.alert(message);

  /// Pushes a browser notification with the given [title] and [body].
  ///
  /// Requires the user's permission to show notifications.
  void pushNotification(String title, String body) {
    if (html.Notification.supported) {
      html.Notification.requestPermission().then((permission) {
        if (permission == 'granted') {
          html.Notification(title, body: body);
        }
      });
    }
  }
}

/// Class representing location information.
class Location {
  /// Gets the current location.
  Future<Location> getCurrentLocation() async {
    var getLocation =
        await html.window.navigator.geolocation.getCurrentPosition();
    return Location(
      accuracy: getLocation.coords?.accuracy,
      altitude: getLocation.coords?.altitude,
      altitudeAccuracy: getLocation.coords?.altitudeAccuracy,
      heading: getLocation.coords?.heading,
      latitude: getLocation.coords?.latitude,
      longitude: getLocation.coords?.longitude,
      speed: getLocation.coords?.speed,
    );
  }

  /// The accuracy of the location in meters.
  num? accuracy;

  /// The altitude of the location in meters.
  num? altitude;

  /// The accuracy of the altitude in meters.
  num? altitudeAccuracy;

  /// The direction in which the device is traveling in degrees.
  num? heading;

  /// The latitude of the location.
  num? latitude;

  /// The longitude of the location.
  num? longitude;

  /// The speed at which the device is traveling in meters per second.
  num? speed;

  /// Constructor for creating a [Location] instance.
  Location({
    this.accuracy,
    this.altitude,
    this.altitudeAccuracy,
    this.heading,
    this.latitude,
    this.longitude,
    this.speed,
  });
}
