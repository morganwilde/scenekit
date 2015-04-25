# Hierarchy descriptions

## SCNNode

**SCNNode** is the child of **SCNObject** . 

### Description

An **SCNNodoe** object is a portion of a scene **graph** (the **hierarchy of nodes**). This node has **no visible** content in the scene. It represents only a **position** in space relative to its **parent node**.

**To construct a scene, you use a hierarchy of nodes to create its structure, then add lights, cameras, geometry to nodes to _create visible content_.**

### Methods and properties

#### Create node

* node 

* nodeWithGeometry: <br/>
```Swift
init(geometry geometry: SCNGeometry) -> SCNNode
```
example:
```Swift
let sphereGeometry = SCNSphere(radius: 1.0)
let sphereNode = SCNNode(geometry: sphereGeometry)
self.rootNode.addChildNode(sphereNode)
scnView.autoenablesDefaultLighting = true
```
![result](https://camo.githubusercontent.com/1dfdacc78a2c76068509ca263d75d648927f6509/687474703a2f2f7777772e7765686561727473776966742e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031342f31302f7368616465645370686572652d65313431343435313739383435362e706e67)
</br>
[full example here](https://www.weheartswift.com/introduction-scenekit-part-1/)

###### Return value
A new node object with geometry attached, or nil if initialization is not successful.

#### Atributes 

*(all properties)*

* name
* light
* camera
* geometry
* morpher : 
*Responsible for blending the node's geometry* 
* skinner :
*The skinner object responsible for skeletal animations of node’s contents.*
* categoryBitMask

#### Node Animation

*(functions)*

* presentationNode
###### Return value
A copy of the current presentation node object.
**! Do not modify the properties of this object !**
###### Usability
(for example) Use it for creating new animation starting at presentation nodes values.
<br/>
(something like that)
<br/>
```Swift
if let currentlyMoving = _currentlyMoving {
    if let presentationNode = currentlyMoving.presentationNode() {
        currentlyMoving.rotation = presentationNode.rotation
    }
    currentlyMoving.position = newLocation
}
```

*(property)*

* paused

#### Node's Transformation

*(properties)*

* transform : *transformation applied to the node is relative to its parent, **Animatable***
* position: *Vector: default is zero.* **Animatable**

## SCNScene

**SCNScene** is the child of **NSObject**.

### Description

The **container** for all **SceneKit content**. You load a scene from a file created in a 3D authoring tool or create one programmatically, then display it in a view.

An **SCNScene** object represents a three-dimentional scene.








