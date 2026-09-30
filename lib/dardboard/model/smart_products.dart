enum SmartProduct {
  all('Tất cả'),
  homegySmartSwitches('Công tắc Homegy'),
  smartSwitches('Công tắc thông minh'),
  securityDevices('Thiết bị an ninh'),
  light('Chiếu sáng'),
  sensor('Cảm biến'),
  powerSocket('Ổ cắm thông minh'),
  centralControllers('Bộ điều khiển TT'),
  smartCurtainMotors('Động cơ rèm'),
  dimmingModules('Module Dimmer'),
  otherDevices('Khác');

  final String label;

  const SmartProduct(this.label);
}
