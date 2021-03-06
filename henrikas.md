# SCNPhysicsWorld
An SCNPhysicsWold simulates physics and is used to control the simulation (e.g. speed, gravity), check for physics bodies' collisions, register behaviours and search for physics bodies in the scene.

#### Properties
```Swift
var gravity: SCNVector3
var speed: CGFloat
var timeStep: NSTimeInterval
unowned(unsafe) var contactDelegate: SKPhysicsContactDelegate //called when two physics bodies collide
```

#### Constants
```Swift
let SCNPhysicsCollisionBitMaskKey: String //SCNPhysicsCollisionCategoryAll (tests all bodies) by default
...
```

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
#### Examples
```Swift
var someScene = SCNScene()
var physicsWorld = someScene.physicsWorld
physicsWorld.gravity = -4
```

# SCNPhysicsBody
An SCNPhysicsBody is used to add physics simulation to a node.

#### Properties
```Swift
var mass: CGFloat
var friction: CGFloat
var restitution: CGFloat
var categoryBitMask: Int
var collisionBitMask: Int
var isResting: Bool {get}
...
```

#### Constants
```Swift
enum SCNPhysicsBodyType : Int {
    case Static
    case Dynamic
    case Kinematic
}
...
```

#### Methods
```Swift
func applyForce(_ direction: SCNVector3,
        impulse impulse: Bool)
func clearAllForces()
...
```

#### Examples
```Swift
var someBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Static, shape: nil) //create physics body
someBody.friction = 0.5 //configure its properties

someNode.physicsBody = someBody //attach body to the node
```

# SCNPhysicsBehavior
An SCNPhysicsBehavior defines high-level behavior (e.g. vehicle) for one or more objects.

#### Behavior classes
SCNPhysicsHingeJoint<br>
SCNPhysicsBallSocketJoint<br>
SCNPhysicsSliderJoint<br>
SCNPhysicsVehicle<br>

#### Examples
```Swift
//create node(s) that you want to add behavior to
var someNode = SCNNode()

//create and configure body(ies
var someBody = SCNPhysicsBody() //Create physics body
someBody.friction = 0.5 //configure its properties
someNode.physicsBody = someBody //attach body to the node

var sliderBehavior: SCNPhysicsSliderJoint! = SCNPhysicsSliderJoint(body: someBody, axis: someAxis, anchor: someAnchor) //create behavior

physicsWorld.addBehavior(sliderBehavior) //add behaviour to physics world
```
# SCNPhysicsField
An SCNPhysicsField object applies forces (e.g. gravitation, electromagnetism) to objects in an area of effect within a scene.

SCNPhysicsField can affect both SCNPhysicsBody and SCNParticleSystem objects.

#### Examples
```Swift
var forceField = SCNPhysicsField.springField //create field with desired effect
forceField.strength = 9.6 //Configure its properties
forceField.categoryBitMask = someCategory

someNode.physicsField = forceField //attach field to the node

```
# SCNPhysicsContact
An SCNPhysicsContact object describes a contact between two physics bodies. These objects are created automatically.

#### Properties
```Swift
var nodeA: SCNNode { get }
var nodeB: SCNNode { get }
var contactPoint: SCNVector3 { get }
...
```

#### Examples
```Swift
physicsWorld.contactDelegate = classThatImplemetsSCNPhysicsContactDelegate //assign class that implements SCNPhysicsContactDelegate protocol to the physics world

//don't forget to set categoryBitMasks and collisionBitMasks
someBody.categoryBitMask = someCategory
someBody.collisionBitMask = someAnotherCategory
```
# SCNPhysicsShape
An SCNPhysicsShape object simulates volume associated with SCNPhysicsBody for use in collision detection.

Physics shapes are immutable.

#### Constants
```Swift
let SCNPhysicsShapeTypeKey: String
let SCNPhysicsShapeKeepAsCompoundKey: String
let SCNPhysicsShapeScaleKey: String
...
```

#### Examples
```Swift
//Create shape
var someShapeWithGeometry = SCNPhysicsShape(geometry: someGeometry, options: nil)
var someShapeWithNode = SCNPhysicsShape(node: someNode, options: nil)

//Combine shapes
var combinedShape = SCNPhysicsShape(shapes: arrayOfShapes, transforms: arrayOfTransforms)

someBody.physicsShape = someShapeWithGeometry
```
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
