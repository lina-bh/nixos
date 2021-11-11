{ ... }: {
  boot.kernelParams = [ "workqueue.power_efficient=Y" ];

  services.tlp = {
    enable = true;
    settings = {
      "CPU_ENERGY_PERF_POLICY_ON_BAT" = "default";
      "DEVICES_TO_DISABLE_ON_STARTUP" = "bluetooth";
    };
  };
}
