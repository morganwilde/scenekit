# SCNParticleSystem

## Summary

Creates a system of particles from small image sprites. Follows a high-level simulation that you can customize. Used for effects of rain, smoke, confetti. Particles are not part of the node hierarchy.

Properties of the system you can control:

1. Appearance - provide an image, tint color, etc.
1. Life span - `particleLifeSpan` property.
1. Emitter behavior - can have a geometry defining the space in which new particles are born.
1. Variation - defines ranges for particle size variation, etc.
1. Movement - define speed, direction, angular velocity
1. Animation - confines to SCNAnimatable.
1. Event handles and particle modifiers - can respond to events like: birth, death or collision.

There is a tool in Xcode to experiment with Particle systems.
