# Example Flutter JVx Client

This example application demonstrates using the [Flutter JVx Client](https://github.com/sibvisions/flutter_jvx) as external library. The app will add custom screens and will use other external libraries to demonstrate the full power.

## Getting Started

* Clone the repository
* Change the config (lib/main.dart)
* Run the app

## Customizing

The client uses a custom screen manager. It is defined in main.dart as screenManager property. The implementation can be found in ExampleCustomScreenManager class. The screen manager is responsible for menu customizing and for opening custom screens.

The example implementation adds a three new screens to the menu:

* Hello Custom Screen
* Telephone Call Screen
* Map Custom Screen

and changes the existing

* Charts

screen. 

The new screens are simple Flutter widgets and don't use the JVx API. The Charts screen uses the JVx API to retrieve data from the remote server and shows custom chart widgets.

## Dependencies

The example application uses [Flutter JVx Client](https://github.com/sibvisions/flutter_jvx). So be sure that you upgrade the dependencies from time to time:

`flutter pub upgrade`

## Preview

<img src="readme_images/login.png" width="280" /> <img src="readme_images/menu.png" width="280" /> <img src="readme_images/userinfo.png" width="280" /> <img src="readme_images/piechart.png" width="280" /> <img src="readme_images/barchart.png" width="280" /> <img src="readme_images/contact.png" width="280" /> <img src="readme_images/form.png" width="280" />
