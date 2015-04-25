## 1. [SCNAction](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/cl/SCNAction)
Action that's executed on a node. Basically the same as SKAction.

Some additional static functions it has (when compared to SKAction):
- [rotateByX(_ x: CGFloat, y: CGFloat, z: CGFloat, duration: NSTimeInterval)](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/clm/SCNAction/rotateByX:y:z:duration:)

    where x,y,z is the angle
- [javaScriptActionWithScript(_ script: String, duration seconds: NSTimeInterval)](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNAction_Class/index.html#//apple_ref/occ/clm/SCNAction/javaScriptActionWithScript:duration:)

    Neat way to use JS to create a custom action. Couldn't find an example xD
    
    
    
## 3 [SCNAnimationEventBlock](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html#//apple_ref/c/tdef/SCNAnimationEventBlock)
Data type that's used by the [SCNAnimationEvent](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html). A block that's invoked when the animation event triggers.

Signature: `typealias SCNAnimationEventBlock = (CAAnimation!, AnyObject!, Bool) -> Void`
Where the parameters are:

| animation       | The animation triggering the animation event.              |
|-----------------|------------------------------------------------------------|
| animatedObject  | The Scene Kit object affected by the animation.            |
| playingBackward | YES if the animation is playing in reverse; otherwise, NO. |
|                 |                                                            |

    
## 3. [SCNAnimationEvent](https://developer.apple.com/library/prerelease/ios/documentation/SceneKit/Reference/SCNAnimationEvent_Class/index.html)
SCNAnimationEvent object is attached to an animation to execute a block at a specific time when the animation plays.






1. [SCNConstraint](../SCNConstraint_Class/index.html#//apple_ref/occ/cl/SCNConstraint) A constraint automatically adjusts the transformation (position, rotation, and scale) of a node based on rules you define.
1. [SCNIKConstraint](../SCNIKConstraint_Class/index.html#//apple_ref/occ/cl/SCNIKConstraint) An <code class="code-voice">SCNIKConstraint</code> object automatically adjusts the orientations of one or more nodes in a specified hierarchy, applying inverse kinematics to make the chain reach toward a target point.
1. [SCNLookAtConstraint](../SCNLookAtConstraint_Class/index.html#//apple_ref/occ/cl/SCNLookAtConstraint) An <code class="code-voice">SCNLookAtConstraint</code> object automatically adjusts a node’s orientation so that it always points toward another node.
1. [SCNTransformConstraint](../SCNTransformConstraint_Class/index.html#//apple_ref/occ/cl/SCNTransformConstraint) An <code class="code-voice">SCNTransformConstraint</code> object runs a block that you specify to compute a new transformation (position, rotation, and scale) for each node affected by the constraint.
1. [SCNHitTestResult](../SCNHitTestResult_Class/index.html#//apple_ref/occ/cl/SCNHitTestResult) Hit-testing is the process of finding elements of a scene located at a specified point, or along a specified line segment (or ray).
1. [SCNLevelOfDetail](../SCNLevelOfDetail_Class/index.html#//apple_ref/occ/cl/SCNLevelOfDetail) Use <code class="code-voice">SCNLevelOfDetail</code> objects to enable automatic substitution of alternate levels of detail for a geometry.
1. [SCNMorpher](../SCNMorpher_Class/index.html#//apple_ref/occ/cl/SCNMorpher) An <code class="code-voice">SCNMorpher</code> object deforms the surface of a node’s geometry, smoothly transitioning between a base geometry and one or more target geometries.
1. [SCNParticlePropertyController](../SCNParticlePropertyController_Class/index.html#//apple_ref/occ/cl/SCNParticlePropertyController) An <code class="code-voice">SCNParticlePropertyController</code> object uses Core Animation semantics to animate a property of the particles rendered by an <code class="code-voice">SCNParticleSystem</code> object.
1. [SCNParticleSystem](../SCNParticleSystem_Class/index.html#//apple_ref/occ/cl/SCNParticleSystem) An <code class="code-voice">SCNParticleSystem</code> object automatically creates, animates, and renders a system of particles—small image sprites—according to a high-level simulation whose general behavior you specify.
1. [SCNRenderer](../SCNRenderer_Class/index.html#//apple_ref/occ/cl/SCNRenderer) An <code class="code-voice">SCNRenderer</code> object renders a SceneKit scene into an arbitrary OpenGL context.
1. [SCNTechnique](../SCNTechnique_Class/index.html#//apple_ref/occ/cl/SCNTechnique) An <code class="code-voice">SCNTechnique</code> object describes a rendering technique that uses one or more additional drawing passes, each of which uses a custom OpenGL shader program to augment or postprocess SceneKit’s rendering of the scene.
1. [SCNTransaction](../SCNTransaction_Class/index.html#//apple_ref/occ/cl/SCNTransaction) The <code class="code-voice">SCNTransaction</code> class defines SceneKit’s mechanism for batching scene graph modifications into atomic updates.
