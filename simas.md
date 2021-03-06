## 1. [SCNAction](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/cl/SCNAction)
Action that's executed on a node. Basically the same as SKAction.

Some additional static functions it has (when compared to SKAction):
- [rotateByX(_ x: CGFloat, y: CGFloat, z: CGFloat, duration: NSTimeInterval)](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/clm/SCNAction/rotateByX:y:z:duration:)

    where x,y,z is the angle
- [javaScriptActionWithScript(_ script: String, duration seconds: NSTimeInterval)](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/clm/SCNAction/javaScriptActionWithScript:duration:)

    Neat way to use JS to create a custom action. Couldn't find an example xD
    
## 2. [SCNAnimationEventBlock](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html#//apple_ref/c/tdef/SCNAnimationEventBlock)
Data type that's used by the [SCNAnimationEvent](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html). A block that's invoked when the animation event triggers.

Signature: `typealias SCNAnimationEventBlock = (CAAnimation!, AnyObject!, Bool) -> Void`

| Parameter       | Use                                                        |
|-----------------|------------------------------------------------------------|
| animation       | The animation triggering the animation event.              |
| animatedObject  | The Scene Kit object affected by the animation.            |
| playingBackward | YES if the animation is playing in reverse; otherwise, NO. |

## 3. [SCNAnimationEvent](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html)
SCNAnimationEvent object is attached to an animation to execute a [SCNAnimationEventBlock](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html#//apple_ref/c/tdef/SCNAnimationEventBlock) at a specific time when the animation plays.

Here's an example:

```Swift
var animation : CAAnimation?
var myNode : SCNNode?

// Event triggered at 50% of the given animation
let event = SCNAnimationEvent(keyTime: 0.5) { (animation, myNode, NO) -> Void in
    println("50% reached!")
}

// Add event
animation?.animationEvents.append(event)
```

## 4. [SCNConstraint](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNConstraint_Class/index.html)
SKConstraint equivalent. A single important note:<br>
*To use physics with a node also affected by constraints, the node’s physicsBody object must be a kinematic physics body.*

## 5. [SCNIKConstraint](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNIKConstraint_Class/index.html#//apple_ref/occ/cl/SCNIKConstraint)

Inverse Kinemtic (IK) Constraints apply on a node chain. The node chain is specified as a base node and a root node, and the 2 nodes must be in the same hierarchy.

There a few steps to make this happen:

1. Build a hierarchy of nodes whose *position* and *pivot*  describe joints between them. These properties are needed to make sure that when rotating a node, it will keep bend at an appropriate point.
2. Create an SCNIKConstraint with the root node being the top node whose orientation will be adjusted by the constraint.
3. `Apply the IK constraint to the end effector node of the chain. In the robot arm example, the end effector is the hand or tool at the end of the arm.`
4. Optionally limit the rotation for a specific joint (node)
5. `To set the constrained nodes in motion, provide a target position for the constraint with its targetPosition property. You can animate a change to this property.`

<img src="https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNIKConstraint_Class/Art/ikconstraint_2x.png" alt="IKConstraint example" width="378" height="300"/>

Example:

```Swift
var upperArm : SCNNode?
var lowerArm : SCNNode?
var hand : SCNNode?

// Create a hierarchy
upperArm?.addChildNode(lowerArm!)
lowerArm?.addChildNode(hand!)

// Position the parts
lowerArm?.position = // Below upperArm
lowerArm?.pivot    = // Transformation matrix ?

hand?.position = // Below lowerArm
hand?.pivot    = // Transformation matrix ?

// Create constraint
var ikConstraint = SCNIKConstraint.inverseKinematicsConstraintWithChainRootNode(upperArm!)
// Set the maximum hand rotation angle
ikConstraint.setMaxAllowedRotationAngle(120.0, forJoint: hand!)

// Add the IKConstraint
hand?.constraints?.append(ikConstraint)
```


## 5. [SCNLookAtConstraint](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNLookAtConstraint_Class/index.html) 

Automatically adjusts a node’s orientation so that it always points toward another node. For example, you can use a look-at constraint to ensure that a camera or spotlight always follows the movement of a game character.

A node points in the direction of the negative z-axis of its local coordinate system.

When Scene Kit evaluates a look-at constraint, it updates the constrained node’s transform property so that the node’s negative z-axis points toward the constraint’s target node.

## 6. [SCNTransformConstraint](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNTransformConstraint_Class/index.html)

Runs a block that you specify to compute a new transformation (position, rotation, and scale) for each node affected by the constraint.

## 7. [SCNTransaction](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNTransaction_Class/index.html)

SCNTransaction executes animations or scene graph modifications.
It's similar to SQL transactions because of the sequential and multi-action execution.

Transaction example:
```Swift
SCNTransaction.begin()
SCNTransaction.setAnimationDuration(2)

textNode?.position = SCNVector3(x:0.0, y:-10.0, z:0.0)
myNode?.opacity = 0.0
heroNode?.opacity = 1.0
heroCamera?.camera!.yFov = 20.0
lightNode?.spotInnerAngle = 30.0

SCNTransaction.commit()
```

## 8. [SCNHitTestResult](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNHitTestResult_Class/index.html)

Hit-testing is the process of finding elements of a scene located at a specified point, or along a specified line segment (or ray).

Example:

```Swift
let view : SCNView?
let results = view?.hitTest(CGPointMake(100, 100), options: nil)
for result in results! {
    if let result = result as? SCNHitTestResult {
        println("Found a node: \(result.node)")
    }
}
```

The other available properties are:

| Property         | Use                                                        |
|------------------|------------------------------------------------------------|
| geometryIndex    | The index of the geometry element whose surface the search ray intersects. (read-only) |
| faceIndex        | The index of the primitive in the geomety element intersected by the search ray. (read-only) |
| localCoordinates | The point of intersection between the geometry and the search ray, in the local coordinate system of the node containing the geometry. (read-only) |
| worldCoordinates | The point of intersection between the geometry and the search ray, in the scene’s world coordinate system. (read-only) |
| localNormal      | The surface normal vector at the point of intersection, in the local coordinate system of the node containing the geometry intersected by the search ray. (read-only) |
| worldNormal      | The surface normal vector at the point of intersection, in the scene’s world coordinate system. (read-only) |
| modelTransform   | The world transform matrix of the node containing the intersection. (read-only) |

## 9. [SCNMorpher](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNMorpher_Class/index.html)

Deforms the surface of a node’s geometry, smoothly transitioning between a base geometry and one or more target geometries.

<p align="center"><img src="https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNMorpher_Class/Art/morpher_2x.png" alt="SCNMorpher example" width="400" height="98" /></p>

```Swift
// Create different shape geometries
var sphereGeometry, cubeGeometry, torusGeometry : SCNGeometry?

// Create a morpher with multiple geometry targets
let morpher = SCNMorpher()
morpher.targets?.append(sphereGeometry!)
morpher.targets?.append(cubeGeometry!)
morpher.targets?.append(torusGeometry!)

// Create a node which will be animated
let myNode = SCNNode(geometry: sphereGeometry!)
myNode.morpher = morpher

// Use a transaction to animate the transitions
SCNTransaction.begin()
SCNTransaction.setAnimationDuration(3)
// Animate to cube
myNode.morpher?.setWeight(0.0, forTargetAtIndex: 1)
SCNTransaction.setCompletionBlock { () -> Void in
    // Done animating to cube
    SCNTransaction.begin()
    SCNTransaction.setAnimationDuration(3)
    // Animate to torus
    myNode.morpher?.setWeight(0.0, forTargetAtIndex: 2)
    SCNTransaction.commit()
}
SCNTransaction.commit()
```

Weight property is generally from 0.0 to 1.0, and it tells to which target, the morpher should lean to.

For example in the above example, setting 0.0 with target 1 would morph to a cube, while 1.0 with the same target would morph to a torus.

Note that the base geometry and all target geometries must be **topologically identical** — that is, they must contain the same number and structural arrangement of vertices.

## 10. [SCNLevelOfDetail](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNLevelOfDetail_Class/index.html) 

Enable automatic substitution of alternate levels of detail for a geometry.

<p align="center"><img src="https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNLevelOfDetail_Class/Art/lod_2x.png" alt="SCNLevelOfDetail example" width="400" height="84"/></p>

Example:
```Swift
// Geometries for different resolutions
var lowResSphereGeo, midResSphereGeo, highResSphereGeo : SCNGeometry?
var lowSphere, midSphere, highSphere : SCNLevelOfDetail

lowSphere = SCNLevelOfDetail(geometry: lowResSphereGeo, screenSpaceRadius: 100)
midSphere = SCNLevelOfDetail(geometry: midResSphereGeo, screenSpaceRadius: 200)
highSphere = SCNLevelOfDetail(geometry: highResSphereGeo, screenSpaceRadius: 300)

// Default geometry
var sphereGeometry : SCNGeometry?
sphereGeometry?.levelsOfDetail = [lowSphere, midSphere, highSphere]

// Sphere node
let sphere = SCNNode(geometry: sphereGeometry!)
```

screenSpaceRadius is the maximum radius (in pixels) of the geometry’s bounding sphere for this level of detail to appear.

-------

11. [SCNParticlePropertyController](../SCNParticlePropertyController_Class/index.html#//apple_ref/occ/cl/SCNParticlePropertyController) An <code class="code-voice">SCNParticlePropertyController</code> object uses Core Animation semantics to animate a property of the particles rendered by an <code class="code-voice">SCNParticleSystem</code> object.
12. [SCNParticleSystem](../SCNParticleSystem_Class/index.html#//apple_ref/occ/cl/SCNParticleSystem) An <code class="code-voice">SCNParticleSystem</code> object automatically creates, animates, and renders a system of particles—small image sprites—according to a high-level simulation whose general behavior you specify.
13. [SCNRenderer](../SCNRenderer_Class/index.html#//apple_ref/occ/cl/SCNRenderer) An <code class="code-voice">SCNRenderer</code> object renders a SceneKit scene into an arbitrary OpenGL context.
14. [SCNTechnique](../SCNTechnique_Class/index.html#//apple_ref/occ/cl/SCNTechnique) An <code class="code-voice">SCNTechnique</code> object describes a rendering technique that uses one or more additional drawing passes, each of which uses a custom OpenGL shader program to augment or postprocess SceneKit’s rendering of the scene.
