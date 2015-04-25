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


