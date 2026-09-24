{
  virtualisation.oci-containers.containers.llm-webui = {
    image = "ghcr.io/open-webui/open-webui:main";
    ports = [ "3000:8080" ];
    volumes = [ "open-webui-data:/app/backend/data" ];
    environment = {
      ENABLE_OLLAMA_API = "False";
      ENABLE_OPENAI_API = "True";
      OPENAI_API_BASE_URL = "http://host.containers.internal:9000/v3";
      WEBUI_AUTH = "False";
    };
    autoStart = false;
  };
}
