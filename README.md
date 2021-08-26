# Documentation

## integratinng webview

In order to integrate flutter with react we have used a package called webview_flutter.

The first screen in the app represents a url loader which loads a website in the app. Here, the webview package provides a widget which takes initialUrl as a parameter and expects a valid url. To enable javascript in the website it expects javascript parameter to be unrestricted.

## Integrating react

To integrate react into flutter we use the same packgage with no initialUrl. Here, we pass a parameter called onWebViewCreated which takes the controller provided by the package. This controller converts the html data into base64 format and this data is then loaded to the url by the controller.

# ScreenShots
![Simulator Screen Shot - iPhone 11 - 2021-08-26 at 19 52 50](https://user-images.githubusercontent.com/40027788/130977820-bdc5aebe-bab7-4d3d-957e-8cc2a3c061a5.png)
![Simulator Screen Shot - iPhone 11 - 2021-08-26 at 19 53 14](https://user-images.githubusercontent.com/40027788/130977849-40415323-5a1f-4743-8e95-740850f37644.png)
