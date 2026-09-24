{
  systemd.tmpfiles.rules = [
    "d /srv/models/openvino 0755 root root -"
  ];

  virtualisation.oci-containers.containers.openvino-server = {
    image = "openvino/model_server:latest-gpu";
    ports = [ "9000:9000" ];
    volumes = [ "/srv/models/openvino:/openvino:ro" ];
    cmd = [
      "--rest_port"
      "9000"
      "--config_path"
      "/openvino/config.json"
    ];
    extraOptions = [
      "--device=/dev/dri"
      "--group-add=keep-groups"
    ];
    autoStart = false;
  };
}
