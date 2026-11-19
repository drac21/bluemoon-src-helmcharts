Per-microservice configuration files:
- service-*.yaml: full values for each microservice, including env and data.enabled.
- data.yaml: per-service ConfigMap data settings; values are intentionally empty
  until application-specific non-secret key/value data is supplied.
- environment.yaml: per-service environment variables copied from each
  service-*.yaml env section, so the environment ConfigMaps stay aligned.
Do not store passwords, tokens, or other secrets in ConfigMaps.
