# SCNPhysicsWorld
An SCNPhysicsWold simulates physics and is used to control the simulation (e.g. speed, gravity), check for physics bodies' collisions, register behaviours and search for physics bodies in the scene.

##### Properties
```Swift
var gravity: SCNVector3
var speed: CGFloat
var timeStep: NSTimeInterval
unowned(unsafe) var contactDelegate: SKPhysicsContactDelegate //Called when two physics bodies collide
```

##### Constants
```Swift
let SCNPhysicsCollisionBitMaskKey: String //SCNPhysicsCollisionCategoryAll (tests all bodies) by default
```
...

##### Methods
```Swift
func updateCollisionsPairs()
func addBehavior(_ behavior: SCNPhysicsBehavior!)
func removeBehavior(_ behavior: SCNPhysicsBehavior!)
func allBehaviors() -> [AnyObject]!
func removeAllBehaviours()
```

