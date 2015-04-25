# SCNPhysicsHingeJoint

## Summary

Used to connect two physics bodies and allow them to pivot around each other on a single axis. It can also be used to pin to an anchor point in the coordinate system of the node containing it.

## Example

```Swift
// Two bodies to be connected
let bodyA = SCNPhysicsBody()
let bodyB = SCNPhysicsBody()

// Axis around which it pivots
let axisA = SCNVector3Zero // Relative to bodyA
let axisB = SCNVector3Zero // Relative to bodyB

// Hinge connection points
let anchorA = SCNVector3Zero // Relative to bodyA
let anchorB = SCNVector3Zero // Relative to bodyB

let hingeJoint = SCNPhysicsHingeJoint(
    bodyA: bodyA,
    axisA: axisA,
    anchorA: anchorA,
    bodyB: bodyB,
    axisB: axisB,
    anchorB: anchorB)
```

# SCNPhysicsSliderJoint

## Summary

Allows one body to slide and or rotate within a single axis in the containing node.

# SCNPhysicsBallSocketJoint
# SCNPhysicsVehicle
# SCNPhysicsVehicleWheel
