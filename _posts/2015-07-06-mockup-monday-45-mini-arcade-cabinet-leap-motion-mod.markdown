---
published: true
layout: video-post
date: 2015-07-06T22:04:58.000Z
img: img/youtube/2015-07-06-_Iw0P2E10Io.jpg
category: Mockup Monday
description: "This video is about Mockup Monday 45"
title: "Mockup Monday #45: Mini Arcade Cabinet Leap Motion Mod"
video-id: "_Iw0P2E10Io"
---
In this video I took my [mini arcade cabinet](http://www.retrobuiltgames.com/diy-kits-shop/porta-pi-arcade-wood-kit-9/) from retrobuiltgames.com and modified it to use a [Leap Motion Controller](https://www.leapmotion.com).  I sent my Leap Motion to [Ryan Bates](https://twitter.com/retrobuiltgames) of retrobuiltgames and he designed and fabricated the new front plate.  It came out awesome!

I swapped out the [Raspberry Pi](https://www.raspberrypi.org) for an [Intel NUC board](http://www.intel.com/content/www/us/en/nuc/nuc-board-de3815tybe.html).  I did this to satisfy two requirements: 1) It can run [Unity](http://unity3d.com) games.  2) It's supported by Leap Motion.  Those forced me to use an x86 board.  The Raspberry Pi is an ARM board.

I want to be able to swap the standard arcade front-plate back in regardless of what hardware platform I'm using to run a game be it Raspberry Pi, Intel NUC, or Mac Mini.  Although the Intel NUC does have a custom header pins like the Raspberry Pi, I'd prefer to have the cabinet provide HDMI, audio in, AND a standard USB cable for user input.  To that end, I got a [Teensy LC](https://www.pjrc.com/teensy/teensyLC.html).  So the arcade stick will just look like a custom 14 key keyboard, that any game or hardware platform can use. I'll post my Teensy code for once it's ready.

Finally, a fun project that'll no doubt see its own Mockup Monday in the future, I got a [Quadruped kit from Sunfounder](http://www.sunfounder.com/index.php?c=videocs&a=vediodetails&typeid=15).  It's an open source, Arduino based robotics kit that comes in way under the price of many comparable legged robotics products that are not open source.
There are other robot platforms that look attractive but are not open source, which I feel like misses half the fun of having a robot platform in the first place.
