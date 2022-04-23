To execute, run "flutter run" in the project's root directory. -d flag can be used for choosing the environment.

The program has been developed on an Pixel 2 API 30 (android) emulator and works smoothly enough there. For web version testing, I suggest scaling the window down to about phone-size (or use the browser's devtools to achieve this) for the most accurate mobile-app experience. Friend's profile page also won't be usable without scaling the window due to image overflow.
When opening a friend's profile on the web version, it seems to freeze for a bit due to asset loading. This does not happen on the emulator, although the image does take a bit to load.
There is also support for android's built-in back button which cannot be tested on the web version.