# Documentation

## integrating webview

In order to integrate webview in flutter we have used a package called webview_flutter.

The first screen in the app represents a url loader which loads a website in the app. Here, the webview package provides a widget which takes initialUrl as a parameter and expects a valid url. To enable javascript in the website it expects javascript parameter to be unrestricted.

## Integrating react on mobile
Here before we load the html in the controller we need to import some cdn provided by the react.
These cdn provide the requested content that is needed by html to integrate react.

Now for browser to understand jsx we import babel cdn which will take care of the jsx.

To integrate react into flutter we use the same packgage with no initialUrl. Here, we pass a parameter called onWebViewCreated which takes the controller provided by the package. First, we load our html file from assets folder in the rootbundle module which provides the necessary content needed by Uri.dataFromString module which then converts the content to a bytes.
This data is then loaded by the controller to render the html.

## Integrating react on web
Through many testings and trying different ways of using same code base to integrate react on all platforms. The best approach to integrate react ion web is through flutter's default IFrame. The iframe takes the same index.html from assets folder and renders the html.

## Problems while trying to integrate react on all platforms with single code base
The main problems that came across while trying to integrate react on flutter was the package support. Since flutter's webview package didnot support on web
and dart:html was not supported on mobile there were many errors regarding unsupported platforms.
Flutter also doesnot have a good concept of platform based import or dynamic import.
While trying to import dart:html it caused application to crash because dart:html is only supported on web. This can cause a huge problem if different packages for both mobile and web needs to be used on single code base.

In order to solve this problem we can take the approach of conditional import. Here we create two different files of same name for web and mobile. Then in our main.dart file we can import the files based on platform which will completely solve the issue.

# ScreenShots
![Simulator Screen Shot - iPhone 11 - 2021-08-26 at 19 52 50](https://user-images.githubusercontent.com/40027788/130977820-bdc5aebe-bab7-4d3d-957e-8cc2a3c061a5.png)
![Simulator Screen Shot - iPhone 11 - 2021-08-26 at 19 53 14](https://user-images.githubusercontent.com/40027788/130977849-40415323-5a1f-4743-8e95-740850f37644.png)
