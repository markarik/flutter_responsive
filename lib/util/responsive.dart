enum ScreenSize { small, medium, large }

const endSmallScreen = 600.0;
const endMediumScreen = 840.0;

ScreenSize getScreenSize(double width) {
  print('width = $width');
  if (width < endSmallScreen) {
    return ScreenSize.small;
  } else if (width >= endSmallScreen && width <= endMediumScreen) {
    return ScreenSize.medium;
  } else {
    return ScreenSize.large;
  }
}
