# Hierarchy descriptions

## SCNNode

Child of **SCNObject** . 

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

* transform : *transformation applied to the node is relative to its parent,* **Animatable**
* position: *Vector: default is zero.* **Animatable**

## SCNScene

Child of **NSObject**.

### Description

The **container** for all **SceneKit content**. You load a scene from a file created in a 3D authoring tool or create one programmatically, then display it in a view.

An **SCNScene** object represents a three-dimentional scene. <br/> **A scene contains a hierarchy of nodes with attached geometries, lights, and cameras—referred to as a scene graph.**

The SCNScene class also provides an interface for reading and writing scene files.

### Animations in scene

A scene object determines the time base for any animations contained in its scene graph. You control scene timing attributes using the methods in **Managing Scene Attributes** and the constants listed in **Scene Attributes**.

### Methods and properties

#### Creating scene 

* Basic scene creation example:

```Swift
let scnView = self.view as SCNView   
scnView.scene = PrimitivesScene()
scnView.backgroundColor = UIColor.blackColor()
```
* Custom scene creation example:

```Swift
let scene = SCNScene()
let sceneView = SCNView()
sceneView.frame = self.view.frame
sceneView.autoresizingMask = UIViewAutoresizing.allZeros
sceneView.scene = scene
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true
sceneView.backgroundColor = UIColor.blueColor()
self.view = sceneView
//add objects below
```

* [more info here](http://rshelby.com/2014/10/create-stonehenge-with-ios-scenekit-and-swift/)

#### Fog

(properties)

* fogStartDistance
* fogEndDistance
* fogDensityExponent
* fogColor

##SCNGeometry

Child of **NSObject**.<br/>
** SCNGeometry **

* SCNBox
* SCNCapsule
* SCNCone
* SCNCylinder
* SCNFloor
* SCNPlane
* SCNPyramid
* SCNShape
* SCNSphere
* SCNText
* SCNTorus
* SCNTube

###Description

SCNGeometry object is three-dimencional shape (Alternative to SKShapeNode and SKSpriteNode)

* You control a geometry’s appearance in a scene with nodes and materials.
* You can easily copy geometries and change their materials.
* You can animate a geometry object.

###Creating

```Swift
// Geometry
let box = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)        
let geometry = box
//add a material to the node
```

###Properties

* levelsOfDetail
* materials : An array of SCNMaterial objects that determine the geometry's appearance when rendered.
![pot](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNGeometry_Class/Art/geometry_multi_material_2x.png)
Materials provide the information SceneKit uses to add color, lighting, texture, and special effects when rendering a geometry. Each SCNMaterial object can be shared between several geometries.<br/>
If a geometry contains multiple elements (see geometryElementCount), you can associate a separate material with each geometry element. **For example**, the teapot has four elements, each with a different material.


##SCNCamera

Child of **NSObject**.

###Description:

To display a scene, you **must** designate a node whose **camera** property contains a camera object as the point of view.

![camera](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNCamera_Class/Art/camera_properties_2x.png)

The **SCNNode** object containing a **camera** defines a **point of view**—that is, the **position** and **orientation** of the camera.

A camera’s **direction** of view is always along the **negative z-axis** of the **node**’s local **coordinate** **system**.

An **SCNCamera** object itself defines the **shape** and, in part, the **appearance** of the rendered **scene** as seen from its **point of view**.

###Example:

* In view did load:

```Swift
//Add camera to scene.
let camera = self.makeCamera()
scene.rootNode.addChildNode(camera)
```
* self.makeCamera() method:

```Swift
func makeCamera() -> SCNNode {
    let camera = SCNCamera()
    let cameraNode = SCNNode()
    cameraNode.camera = camera
    cameraNode.position = SCNVector3(x: 0, y: 35, z: 120)
    camera.zFar = 1000
    return cameraNode
}
```

* [more info here](http://rshelby.com/2014/10/create-stonehenge-with-ios-scenekit-and-swift/)

##SCNView

Child of **NSView**.

###Description

You use an **SCNView** object to render SceneKit content for display in your app. To provide content for a SceneKit view, assign an **SCNScene** object to its scene property.

###Example
look at SCNScene example!!

##SCNMaterial

Child of **NSObject**.

###Description

A **reusable** definition of **surface** **appearance** properties for an **object**. Materials specify how a **surface** is **colored** or **textured** and how it **responds to lights** in the **scene**.

###Creating

Create material and add it through *firstMaterial* or *materials* properties.

Materials **color** or **texture** sets through *contents* property.

```Swift
// Material
let material = SCNMaterial()
material.diffuse.contents = UIColor.redColor()
geometry.firstMaterial = material
```

###Material’s Visual Properties

*all read only*

Use thorugh property's **contents** object.

* diffuse
![diffuse](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_diffuse_2x.png)
* ambient
![ambient](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_ambient_2x.png)
* specular
![specular](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_specular_2x.png)
* normal
![normal](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_normal_2x.png)
* reflective
![reflective](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_reflective_2x.png)
* emission
![emission](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_emission_2x.png)
* transparent
![transparent](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_transparent_2x.png)
* multiply
![multiply](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/mat_multiply_2x.png)


###Ligtening models

#### Declarations

```Swift
let SCNLightingModelPhong: String
let SCNLightingModelBlinn: String
let SCNLightingModelLambert: String
let SCNLightingModelConstant: String
```

![lightening](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterial_Class/Art/shading_2x.png)

##SCNMaterialProperty

Child of **NSObject**.

An **SCNMaterialProperty** object represents the contents—**color**, **texture**, or other **visual elements—of** one of a material’s visual properties. For material properties with **texture** contents, the **SCNMaterialProperty** class also controls texturing options such as **wrapping**, **filtering**, and **texture coordinate transformation**.

SceneKit uses the material property’s **contents** object in different ways **for each visual property** of a **material**. For example:

* When you provide a **color** for the **diffuse property**, it determines the material’s **base color**—geometries using the material appear shaded in gradations of this color when illuminated by white light.

* When you provide a color for the **specular property**, it affects the color of light reflected directly toward the viewer from the surface of a geometry using the material.

* The **normal property** specifies the orientation of a surface at each point. SceneKit uses this image (called a normal map) in lighting, creating the illusion of a complex, bumpy surface without increasing the complexity of the geometry.

SceneKit also uses SCNMaterialProperty objects elsewhere:

* To provide content to be rendered behind a scene, in the background property of an SCNScene object,

* To affect the color and shape of illumination from a light source, in the gobo property of an SCNLight object.

* To bind texture samplers to custom GLSL shader source code snippets, in classes conforming to the SCNShadable protocol.

![as](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNMaterialProperty_Class/Art/cubemap_2x.png)

##SCNLight

###Description

An **SCNLight** object represents a light source. SceneKit provides **four** types of light: **ambient**, **directional**, **omnidirectional**, and **spot**. You illuminate your scene by attaching lights to **SCNNode** objects using their **light property**.

###Example

Creating light, then creating simle node which will be holding the light and adding that node to camera node (or other node).

```Swift
// A spotlight
var spotLight = SCNLight()
spotLight.type = SCNLightTypeSpot()
spotLight.color = NSColor.redColor()
var spotLightNode = SCNNode()
spotLightNode.light = spotLight
spotLightNode.position = SCNVector3Make(-2, 1, 0)
cameraNode.addChildNode(spotLightNode)
```

![light](http://ronnqvi.st/images/simple-box.png)




