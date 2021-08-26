# Documentation

## Flutter integration with react using webview

In order to integrate flutter with react we have used a package called webview_flutter.

The first screen in the app represents a url loader which loads a website in the app. Here, the webview package provides a widget which takes initialUrl as a parameter and expects a valid url. To enable javascript in the website it expects javascript parameter to be unrestricted.

### Integrating react in flutter

To integrate react into flutter we use the same packgage with no initialUrl. Here, we pass a parameter called onWebViewCreated which takes the controller provided by the package. This controller converts the html data into base64 format and this data is then loaded to the url by the controller.

