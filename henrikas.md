# SCNPhysicsWorld
An SCNPhysicsWold simulates physics and is used to control the simulation (e.g. speed, gravity), check for physics bodies' collisions, register behaviours and search for physics bodies in the scene.

#### Properties
```Swift
var gravity: SCNVector3
var speed: CGFloat
var timeStep: NSTimeInterval
unowned(unsafe) var contactDelegate: SKPhysicsContactDelegate //Called when two physics bodies collide
```

#### Constants
```Swift
let SCNPhysicsCollisionBitMaskKey: String //SCNPhysicsCollisionCategoryAll (tests all bodies) by default
```
...

#### Methods
```Swift
func updateCollisionsPairs()
func addBehavior(_ behavior: SCNPhysicsBehavior!)
func removeBehavior(_ behavior: SCNPhysicsBehavior!)
func allBehaviors() -> [AnyObject]!
func removeAllBehaviours()
func contactTestBetweenBody(_ bodyA: SCNPhysicsBody!,
                    andBody bodyB: SCNPhysicsBody!,
                    options options: [NSObject : AnyObject]!) -> [AnyObject]!
func contactTestWithBody(_ body: SCNPhysicsBody!,
                 options options: [NSObject : AnyObject]!) -> [AnyObject]!

```

# SCNPhysicsBehavior
An SCNPhysicsBehavior defines high-level behavior (e.g. vehicle) for one or more objects.

#### Behavior classes
SCNPhysicsHingeJoint<br>
SCNPhysicsBallSocketJoint<br>
SCNPhysicsSliderJoint<br>
SCNPhysicsVehicle<br>

#### Examples
##### How to use
```Swift
var someScene = SCNScene()
var physicsWorld = someScene.physicsWorld

var someNode = SCNNode() //Node that you want to add behavior to

var someBody = SCNPhysicsBody() //Create physics body
someBody.friction = 0.5 //configure its properties
someNode.physicsBody = someBody //attach body to the node

var sliderBehavior: SCNPhysicsSliderJoint! = SCNPhysicsSliderJoint() //create behavior

physicsWorld.addBehavior(sliderBehavior) //add behaviour to physics world
```
