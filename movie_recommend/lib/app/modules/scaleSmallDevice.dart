double scaleSmallDevice(double height) {
  // For tiny devices.
  if (height < 600) {
    return 0.8;
  }
  if (height > 600 && height < 700){
    return 0.9;
  }
  // For normal devices.
  return 1.0;
}
