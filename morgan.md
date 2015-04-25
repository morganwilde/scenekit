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
