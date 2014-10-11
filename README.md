# glsl-specular-beckmann
Computes the specular power from the Beckmann distribution

# Example

```glsl
#pragma glslify: beckmann = require(glsl-specular-beckmann)

uniform vec3 eyePosition;
uniform vec3 lightPosition;

uniform float shininess;

varying vec3 surfacePosition;
varying vec3 surfaceNormal;

void main() {
  vec3 eyeDirection = normalize(eyePosition - surfacePosition);
  vec3 lightDirection = normalize(lightPosition - surfacePosition);
  vec3 normal = normalize(surfaceNormal);

  float power = beckmann(lightDirection, viewDirection, normal, shininess);

  gl_FragColor = vec4(power,power,power,1.0);
}
```

# Usage

Install with npm:

```
npm install glsl-specular-beckmann
```

Then use with [glslify](https://github.com/stackgl/glslify).

# API

```glsl
#pragma glslify: phong = require(glsl-specular-beckmann)
```

##### `float beckmann(vec3 lightDir, vec3 eyeDir, vec3 normal, float shininess)`
Computes the specular power in the Beckmann model

* `lightDir` is a *unit length* `vec3` pointing from the surface point toward the light
* `eyeDir` is a *unit length* `vec3` pointing from the surface point toward the camera
* `normal` is the surface normal at the sample point
* `shininess` is the shininess factor

**Returns** A `float` representing the specular power

# License
(c) 2014 Mikola Lysenko. MIT License