# PDF Maker Website

A beautiful website with a fountain-like animated background using Vanta.js, designed for PDF manipulation tools.

## Features

- Stunning water-like animated background using Vanta.js
- Responsive design that works on desktop and mobile
- Navigation for various PDF operations: Merge, Split, Compress, and Convert
- Modern UI with hover effects and clean typography

## How to Use

1. Simply open the `index.html` file in your web browser to view the website.
2. No server setup required - all animation processing happens in the browser using Three.js.

## Customization

The fountain animation is created using Vanta.js Waves effect with custom parameters. You can modify these parameters in the JavaScript section at the bottom of the `index.html` file:

```javascript
VANTA.WAVES({
    el: "#vanta-background",
    mouseControls: true,
    touchControls: true,
    gyroControls: false,
    minHeight: 200.00,
    minWidth: 200.00,
    scale: 1.00,
    scaleMobile: 1.00,
    color: 0x0077ff,
    shininess: 60.00,
    waveHeight: 30.00,
    waveSpeed: 1.50,
    zoom: 0.75,
    mouseEase: true,
    forceAnimate: true,
    backgroundColor: 0x063970,
    speed: 1.25,
    amplitudeFactor: 2.5
});
```

Adjust these values to change the animation behavior and appearance:
- `color`: The color of the water (hexadecimal value)
- `waveHeight`: The height of the waves
- `waveSpeed`: The speed of the wave animation
- `shininess`: The reflectivity of the water surface
- `backgroundColor`: The background color behind the waves

## Dependencies

This project uses:
- Three.js (r134) - For 3D rendering
- Vanta.js - For the animated background effects

All dependencies are included in the `vanta-master` directory.

## Credits

- Vanta.js library by Teng Bao: https://github.com/tengbao/vanta
- Three.js: https://threejs.org/ 