# Note on demo screenshots

To produce all of the screenshots for the different geometries, I have used this code.

```Swift
class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        let box = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
        
        let geometry = box // This is where you would change to different geometries
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.rotation = SCNVector4(x: Float(M_PI / 4), y: 1, z: 0, w: 1.0)
        scene.rootNode.addChildNode(geometryNode)
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 30)
        scene.rootNode.addChildNode(cameraNode)
        
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
    }
}
```

# SCNGeometry

## Summary

This class represents 3D objects as a collection of: vertices, normals, texture coordinates. You attach geometries to SCNNode to define visual elements. SCNMaterial attach to geometries and determine appearance.

- You control the position of a geometry within a scene with a SCNNode.
- You control the texture, how it responds to light, special effects of a geometry with SCNMaterial objects.
- Vertex data is immutable.
- You can copy vertex data and change materials to create different models.
- You can animate a geometry using SCNMorpher and SCNSkinner. SCNShadeable protocol allows you to have custom GLSL shader programs.

## You can create geometries in 4 different ways

1. Load from scene file (SCNScene, SCNSceneSource)
1. Use and customize primitive shapes (SCNPlane, SCNBox, SCNSphere, SCNPyramid, SCNCone, SCNCylinder, SCNCapsule, SCNTube, SCNTorus)
1. Create 3D geometry from 2D text/bezier curvers (SCNText, SCNShape)
1. Create a custom geometry from vertex data (SCNGeometrySource, SCNGeometryElement)

# SCNBox

## Summary

A six-sided polyhedron whose faces are all rectangular. Corners can be rounded.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNBox_Class/Art/ps_box_2x.png)

Size of the box is defined by these properties

- `width`
- `height`
- `length`

Corner rounding, or chamfer, is controlled by `chamferRadius`.

Since it has 6 faces, you can define 6 materials.

## Example

```Swift
let box = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
```

![](shape-screens/box.png)

# SCNCapsule

## Summary

A circular cylinder with hemispheres at each end.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNCapsule_Class/Art/ps_capsule_2x.png)

## Example

```Swift
let capsule = SCNCapsule(capRadius: 10, height: 30)
```

# SCNCone

## Summary

A right circular cone.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNCone_Class/Art/ps_cone_2x.png)

## Example

```Swift
let cone = SCNCone(topRadius: 0, bottomRadius: 10, height: 20)
```

# SCNCylinder

## Summary

A circular cylinder

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNCylinder_Class/Art/ps_cylinder_2x.png)

## Example

```Swift
let cylinder = SCNCylinder(radius: 20, height: 20)
```

# SCNFloor

## Summary

Models an infinite plane, usually provides a background for a scene.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNFloor_Class/Art/tex_floor_2x.png)

## Example

```Swift
let floor = SCNFloor()
```

# SCNPlane

## Summary

A one sided rectangular plane. Can have rounded corners.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNPlane_Class/Art/ps_plane_2x.png)

## Example

```Swift
let plane = SCNPlane(width: 20, height: 20)
```

# SCNPyramid

## Summary

A right rectangular pyramid.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNPyramid_Class/Art/ps_pyramid_2x.png)

## Example

```Swift
let pyramid = SCNPyramid(width: 20, height: 30, length: 20)
```

# SCNShape

## Summary

Creates a 3D shape from a 2D path. You can also extrude the path.

## Example

```Swift
let shapePath = UIBezierPath()
shapePath.moveToPoint(CGPoint(x: 0, y: 0))
shapePath.addCurveToPoint(
    CGPoint(x: 20, y: 20),
    controlPoint1: CGPoint(x: 20, y: 0),
    controlPoint2: CGPoint(x: 20, y: 10))

let shape = SCNShape(path: shapePath, extrusionDepth: 10)
```

# SCNSphere

## Summary

Models a sphere.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNSphere_Class/Art/ps_sphere_2x.png)

## Example

```Swift
let sphere = SCNSphere(radius: 20)
```

# SCNText

## Summary

Renders text. You can also extrude the new text shape to make an object with depth.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNText_Class/Art/tex_floor_2x.png)

## Example

```Swift
let text = SCNText(string: "Testing", extrusionDepth: 10)
```

# SCNTorus

## Summary

Models a torus (a ring shape).

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNTorus_Class/Art/ps_torus_2x.png)

## Example

```Swift
let torus = SCNTorus(ringRadius: 20, pipeRadius: 5)
```

# SCNTube

## Summary

A tube (circular cylinder with a circular hole in the middle).

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNTube_Class/Art/ps_tube_2x.png)

## Example

```Swift
let tube = SCNTube(innerRadius: 5, outerRadius: 20, height: 20)
```

# SCNGeometryElement

## Summary

One of two classes used to create custom geometry from vertex data. This class is used to separate groups of vertices into materials. This allows you to assign different texture/color properties to those groups. An instance of this class is required when calling the initialiser of `SCNGeometry`.

![](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SCNGeometryElement_Class/Art/geometry_multi_material_2x.png)

## Example

```Swift
let vertexIndexArray: [CInt] = [0, 1, 2]
let data = NSData(bytes: vertexIndexArray, length: vertexIndexArray.count * sizeof(CInt));
let geometrySource = SCNGeometrySource()

let geometryElement = SCNGeometryElement(
    data: data,
    primitiveType: .Triangles,
    primitiveCount: vertexIndexArray.count / 3,
    bytesPerIndex: sizeof(CInt))

let geometryFromElement = SCNGeometry(sources: [geometrySource], elements: [geometryElement])
```

# SCNGeometrySource

## Summary

One of two classed used to create custom geometry from vertex data. This class is a container for all the vertices that define the shapes geometry.

## Example

```Swift
let vertexArray: [SCNVector3] = [
    SCNVector3(x: 0, y: 0, z: 0),
    SCNVector3(x: 10, y: 0, z: 0),
    SCNVector3(x: 10, y: 10, z: 0)
]

let geometrySource = SCNGeometrySource(vertices: vertexArray, count: vertexArray.count)

let geometryElement = SCNGeometryElement()
let geometryFromSource = SCNGeometry(sources: [geometrySource], elements: [geometryElement])
```
