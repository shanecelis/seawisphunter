---
published: true
layout: video-post
date: 2015-01-06T20:29:28.000Z
img: img/youtube/2015-01-06-UzL-bzD-J1w.jpg
category: product
description: "GraphCraft will be available in the Unity3D Asset Store soon. More info and a longer video available here: http://seawisphunter.com/mockup%20monday/2015/01/05/mockup-monday-34-graphcraft-for-unity3d/"
title: "GraphCraft"
video-id: "b7MYfArhqr0"
---
GraphCraft is available on the [Unity Asset Store](http://u3d.as/content/seawisp-hunter-llc/graph-craft/b1o).

* * *

GraphCraft is probably best understood by seeing it in action, even
just 30 seconds of action. Please see the
[GraphCraft in 30 Seconds](https://www.youtube.com/watch?v=b7MYfArhqr0)
video.

GraphCraft is a
[Unity asset](http://u3d.as/content/seawisp-hunter-llc/graph-craft/b1o)
that uses graphs---constituted by vertices and edges---to
construct recursively-describable bodies.  This is a hybrid approach
between procedural generation and manual creation.  The graphs are
created manually then used to automatically construct a new
procedurally generated object according to simple rules.  Unity
developers can design symmetric multi-segmented composable bodies
using the familiar Unity Editor tools.  The Graph Preview shows what
effects one's edits have in real-time.  The Graph Constructor
instantiates the game objects according to the graph.

Examples
--------

There are three examples:

1. <a href="/img/graphcraft-example.png"><img src="/img/graphcraft-example.png" style="float:right;" width="250px"></a>The `Example Scene` shows progressively more complex graphs and
   their results.  a) The "Snake" shows a graph with one vertex and
   one edge that connects back to itself.  b) The "Tree" shows a graph
   with one vertex and two self-edges; the vertex also is a rigid body
   with a hinge joint with limits enabled so it sags after
   construction. c) The "Quadrapus" shows a composite reusing the
   "Snake" to create four legs.  It has a rigid body, hinge joint, and
   a script that causes its motors to flex sinusoidally. d) The
   humanoid has 3 vertices and 7 edges and shows how one complete
   design may be easily replicated into a "family" of different sizes.

2. <a href="/img/graphcraft-centipede-example.png"><img src="/img/graphcraft-centipede-example.png" style="float:right;" width="200px"></a>The `Centipede Example` scene is the result of an introduction and
   tutorial video to GraphCraft made for
   [Mockup Monday #34](http://seawisphunter.com/mockup%20monday/2015/01/05/mockup-monday-34-graphcraft-for-unity3d/).<br><br><br><br><br><br>

3. <a href="/img/graphcraft-30-seconds-example.png"><img src="/img/graphcraft-30-seconds-example.png" style="float:right;" width="200px"></a>The `30 Seconds Example` scene is the resulting scene used in the
   video
   [GraphCraft in 30 Seconds](https://www.youtube.com/watch?v=b7MYfArhqr0).

Other Uses
----------

You can use GraphCraft to build lots of things: trees, quadrupeds,
fish, snakes, broccoli, flowers, buildings---anything that has a
recursive or fractal, reuse-of-parts at differing scales is admissible
and many animals and plants do.  My foremost interest in GraphCraft is
to use it for is building interesting robot bodies, so it's a robot
construction kit for me, but it's just as capable as a flower
generator for someone else and an architecture motif explorer for yet
another person.

Usage
-----

GraphCraft exposes a set of tools under the menu
`Components->GraphCraft` that enables you to create graphs---that is
vertices and edges---in the Unity Editor.  To create a "Snake" from the `Example Scene` for example, one would do the following:

1. Create a cube.
2. Select the cube.
3. Add a vertex by selecting the menu item `Components->GraphCraft->Vertex`.
4. Add an edge connected to itself by selecting the menu item `Components->GraphCraft->Connect To Self`.
5. Add a preview by selecting the menu item `Components->GraphCraft->Preview Graph`.
6. Select the edge and scale, rotate, or translate it to one's liking.
7. Adjust the edge's count so that multiple segments of the snake will
be created.
8. Add a constructor by selecting the menu item `Components->GraphCraft->Construct Graph`.  Hit play to construct.

Please see
[Mockup Monday #34](http://seawisphunter.com/mockup%20monday/2015/01/05/mockup-monday-34-graphcraft-for-unity3d/)
for a video tutorial.
