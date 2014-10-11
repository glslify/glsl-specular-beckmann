#define PI 3.141592653589793

float beckmannSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  float roughness) {

  vec3 H = normalize(lightDirection + viewDirection);
  float NdotH = max(dot(surfaceNormal, H), 0.0);
  float cos2Alpha = NdotH * NdotH;
  float tan2Alpha = (cos2Alpha - 1.0) / cos2Alpha;
  float roughness2 = roughness * roughness;
  float denom = PI * roughness2 * cos2Alpha * cos2Alpha;

  return exp(tan2Alpha / roughness2) / denom;
}

#pragma glslify: export(beckmannSpecular)