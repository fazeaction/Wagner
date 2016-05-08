// non-dependent texture read according to : 
// http://xissburg.com/faster-gaussian-blur-in-glsl/

varying vec2 vUv;
varying vec2 blurTexCoords[9];
uniform vec2 delta;
uniform vec2 resolution;

void main() {

  vUv = uv;
  vec2 inc = delta / resolution;


  blurTexCoords[ 0 ] = vUv - inc * 4.;
  blurTexCoords[ 1 ] = vUv - inc * 3.;
  blurTexCoords[ 2 ] = vUv - inc * 2.;
  blurTexCoords[ 3 ] = vUv - inc * 1.;
  blurTexCoords[ 4 ] = vUv;
  blurTexCoords[ 5 ] = vUv + inc * 1.;
  blurTexCoords[ 6 ] = vUv + inc * 2.;
  blurTexCoords[ 7 ] = vUv + inc * 3.;
  blurTexCoords[ 8 ] = vUv + inc * 4.;
  

  gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

}