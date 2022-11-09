## Posa Bottom Bar 🔥

- made by Hmida71

### ANIMATION EXAMPLE

| Animation Icons | Animation elevation and opacity |
|---------|----------|
|![FanBottomNavyBar Gif](https://user-images.githubusercontent.com/69757558/200888205-fbdd698c-39ae-4b04-a0d1-4560d746f83f.gif) | ![Fix Gif](https://user-images.githubusercontent.com/69757558/200888217-37199c10-6186-4ab5-b254-c44bec68daec.gif) |


## Customization

### PosaBottomBar (REQUIRED ITEMS)

- `child` - add here your page or navigator pages.
- `icons` - list of items (IconData), required more than one item and less than six.
- `onChanged` - required to listen when an item is tapped it provides the selected item's index.

### PosaBottomBar (OPTIONAL ITEMS)

- `onLongPress` - required to listen when an item is longPressed it provides the selected item's index.
- `iconSize` - the item icon's size.
- `dotSize` - bottom(bottom of icon) items size.
- `backgroundColor` - the navigation bar's background color.
- `elevation` - if make it 0 elevation will be removed.
- `shadowColor` - color of elevation bottom bar.
- `borderRadius` - radius of bottom bar.
- `height` - changes the Navigation Bar's height.
- `margin` - changes the Navigation Bar's margin.
- `alignment` - use this property to change the vertical alignment of the bottom bar. It is mostly used when you have two (center) or (centerBottom) or (centerTop) the bar.
- `isElevationAnimation` - if make it true we get somme animation of elevation.
- `elevationAnimationOpacity` - if change if to > 0.3 the color of elevation becomes too dark.
- `elevationAnimationDuration` - param to customize the item change's animation duration
- `isAnimatedIcon` - if make it true we get somme animation icons position

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  posa_bottom_bar: ^latest_version
```

## Basic Usage

Adding the widget

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POSA BOTTOM BAR"),
        centerTitle: true,
      ),
      body: PosaBottomBar(
        // CHILD IS REQUIRED
        child: pages
            .elementAt(currentIndex), // ADD HERE YOUR PAGE OR PAGES NAVIGATOR
        // ICONS IS REQUIRED
        icons: const [
          Ionicons.home_outline,
          Ionicons.settings_outline,
          Ionicons.bookmark_outline,
          Ionicons.person_outline,
        ],
        // ONCHANGE IS REQUIRED
        onChanged: (i) {
          setState(() {
            debugPrint("TAP $i");
            currentIndex = i;
          });
        },
        // ON LONG PRESS FNC
        onLongPress: (i) {
          setState(() {
            debugPrint("LONG PRESS $i");
          });
        },
        alignment: Alignment.bottomCenter,
        // ------ height and margin for bottom bar ----- //
        height: 0.16,
        margin: 0.05,
        // ------  ----- //

        // ------ Elevation & Color for bottom bar ----- //
        elevation: 10,
        shadowColor: Colors.black,
        // ------  ----- //

        borderRadius: 35, // RADUIS (FOR BOTTOM BAR)
        backgroundColor: Colors.blueAccent, // BACKGROUND COLORS (FOR BOTTOM BAR)
        dotColor: Colors.white, // COLORS OF DOT
        iconColor: Colors.white, // COLORS OF ICON
        dotSize: 5.0, iconSize: 24.0, // SIZE OF DOT AND ICONS

        // ------ Animation elevation and opacity ----- //
        isElevationAnimation: false,
        elevationAnimationOpacity: 0.3,
        elevationAnimationDuration: const Duration(milliseconds: 1500),
        // ------  ----- //

        // ------ Animation Icons ------ //
        isAnimatedIcon: false,
        // ------  ------ //
      ),
    );
  }
```
