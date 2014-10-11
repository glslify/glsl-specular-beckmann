#define PI 3.141592653589793

float beckmannSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  float shininess) {

  vec3 H = normalize(lightDirection + viewDirection);
  float NdotH = dot(N, H);
  float cos2Alpha = NdotH * NdotH;
  float tan2Alpha = (1.0 - cos2Alpha) / cos2Alpha;
  float shininess2 = shininess * shininess;
  float denom = PI * shininess2 * cos2Alpha * cos2Alpha;

  return exp(-tan2Alpha / shininess2) / denom;
}

#pragma glslify: export(beckmannSpecular)