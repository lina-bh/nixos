{ ... }: {
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "uk"; };
  services.xserver = {
    layout = "gb";
    xkbOptions = "compose:ralt";
  };
}
