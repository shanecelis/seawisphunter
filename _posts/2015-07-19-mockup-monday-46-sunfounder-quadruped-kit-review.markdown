---
published: true
layout: video-post
date: 2015-07-19T22:38:13.000Z
img: img/youtube/2015-07-19-wJBmK_GoBTw.jpg
category: Mockup Monday
description: "A real live quadruped!"
title: "Mockup Monday #46: Sunfounder Quadruped Kit Review"
video-id: "wJBmK_GoBTw"
tags: mockup-monday
---
In this Mockup Monday, I review the [Sunfounder Crawling Quadruped Robot Kit for Arduino](http://www.sunfounder.com/index.php?c=blogcs&a=details&id=46&memberid=1).  I'm not affiliated with Sunfounder.  This review is my personal opinion.

# Assembly

This is a kit, so it does require some assembly.  If you've done anything with an Arduino, this kit should be very easy for you to put together.  If you haven't, this kit is a great reason to try out Arduino.  In [the video](https://www.youtube.com/watch?v=wJBmK_GoBTw) I show some photos of the build and talk about some gotchas.  Overall the kit was easy to put together like a big lego kit.  It didn't require any specialized tools.  There is no soldering.  It even comes with a small screwdriver.  Although you might want a knife or a pair of scissors to help remove the adhesive that comes on the acrylic.  It does not include that batteries, which are specialized, but [I got four and a charger for cheap on amazon](http://www.amazon.com/gp/product/B00935L08O?psc=1&redirect=true&ref_=oh_aui_detailpage_o03_s00).

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Who got a quadruped robotics kit? [Points four legs at himself.] This guy! <a href="https://twitter.com/hashtag/robots?src=hash">#robots</a> <a href="https://twitter.com/hashtag/feellikeakid?src=hash">#feellikeakid</a> <a href="https://twitter.com/hashtag/sunfounder?src=hash">#sunfounder</a> <a href="http://t.co/vql9er2Kza">pic.twitter.com/vql9er2Kza</a></p>&mdash; Shane Celis (@shanecelis) <a href="https://twitter.com/shanecelis/status/618211395587436545">July 7, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The servos attach to these little white discs which need to be screwed
onto the acrylic.  There are twelve discs and each one requires eight
tiny screws.  These screws are easy to torque the heads right off, so
be gentle.  This part of the build was admittedly tedious, but the
rest went very smoothly.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Torque&#39;d the heads right off a few of these screws. Oops. <a href="https://twitter.com/hashtag/robots?src=hash">#robots</a> <a href="https://twitter.com/hashtag/sunfounder?src=hash">#sunfounder</a> <a href="http://t.co/hsufMoMrwM">pic.twitter.com/hsufMoMrwM</a></p>&mdash; Shane Celis (@shanecelis) <a href="https://twitter.com/shanecelis/status/618591460590546944">July 8, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

An odd that happened was that it's on while you assemble it at one point, so it flinches while you work on it.  Kind of eerie.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Instructs you to assemble with the servos on. So it flinches while I work on it. Strange feeling. <a href="https://twitter.com/hashtag/sunfounder?src=hash">#sunfounder</a> <a href="https://twitter.com/hashtag/robots?src=hash">#robots</a> <a href="http://t.co/n4bF7IYIrJ">pic.twitter.com/n4bF7IYIrJ</a></p>&mdash; Shane Celis (@shanecelis) <a href="https://twitter.com/shanecelis/status/618859072549441536">July 8, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I did have a little difficulty trying to get my Mac to see the Arduino Nanos.  Turns out I needed this [driver from Prolific](http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41).  I informed Sunfounder about this, and they responded very quickly that they updated their documentation and download, which I thought was pretty impressive.

I do wish I had a chip extractor on hand because I think I damaged my
Arduino Nano's USB port on the transmitter by removing it clumsily.
However, [you can still burn a program onto an Arduino with a busted USB port](http://forum.arduino.cc/index.php?topic=178540.0) if you have another Arduino handy.  So I burned on the `Remoter` code and it's working fine.

<blockquote class="twitter-tweet" lang="en"><p lang="tl" dir="ltr">Arduino Uno to rescue his buddy <a href="https://twitter.com/hashtag/Arduino?src=hash">#Arduino</a> Nano. <a href="http://t.co/tju0l5qKJv">pic.twitter.com/tju0l5qKJv</a></p>&mdash; Shane Celis (@shanecelis) <a href="https://twitter.com/shanecelis/status/619162093040873472">July 9, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

After assembly there's a calibration step, which I was kind of relieved by because when I attached my servos, they weren't all making the nice 90 degree angles that I was seeing in the documentation.

# Open Source

First let me say that I've been very interested in legged-robot kits.  I've used [virtual quadrupeds for research](http://www.shanecelis.com/publications.html) and I'm using them now in [a video game I'm making](http://quadrapussumo.com).  I've kept an eye on the [Robugtix](http://www.robugtix.com) models for instance, which look like an excellent consumer robot.  However, the fact that Robugtix's software is proprietary and closed source means it's of a limited use beyond its pre-programmed features.  And to me programming a robot is more than half the fun.

One thing that differentiates [Sunfounder](http://sunfounder.com)'s kit is that all the code is open source.  This is a huge benefit for people who want to get under the hood and tinker.  Here's just a for instance of some tinkering one might want to do: the default crawling code causes two legs to move even if you just tap the joystick up for a moment.  Here's a snippet of code that handles responding to the transmitter.

    void loop() {
      Serial.println("Waiting for radio signal");

      byte order;
      while (1)   {
        if (radio.available()) {
          if (radio.read(&order, 1)) {
            if (order > 0) {
              Serial.print("Order:");
              Serial.print(order);
              Serial.print(" //");

              if (order < 5)
                if (!is_stand())
                  stand();

              switch (order) {
              case 1:
                Serial.println("Step forward");
                step_forward(1);
                break;
              case 2:
                Serial.println("Step back");
                step_back(1);
                break;
              case 3:
                Serial.println("Turn left");
                turn_left(1);
                break;
              case 4:
                Serial.println("Turn right");
                turn_right(1);
                break;
              ...

Now if we want to have the remote control behave a little less "digitally" and behave more like an analog stick, we can dig into the `step_forward()` function. Maybe we'd change `step` from an integer to a floating point number.  Not sure, but the most important thing is it's not impossible.

    /*
     - go forward
     - blocking function
     - parameter step steps wanted to go
     */
    void step_forward(unsigned int step) {
      move_speed = leg_move_speed;
      while (step-- > 0) {
        if (site_now[2][1] == y_start) {
          //leg 2&1 move
          set_site(2, x_default + x_offset, y_start, z_up);
          wait_all_reach();
          set_site(2, x_default + x_offset, y_start + 2 * y_step, z_up);
          wait_all_reach();
          ...

Even if you're not a programmer, having a open source kit is really important because this means this kit will get better with time.  People will release new bits of code that will enable your robot to do new things!  Open source products get better with time---not worse.  I'm intent on making my robot controllable via a [Leap Motion](http://leapmotion.com) Controller similar to what I've done in [Quadrapus Sumo](http://quadrapussumo.com).

# Results

Once I put the quadruped together, calibrated it, and loaded the code, I tried it out.  You can see its near first run here:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/hashtag/Sunfounder?src=hash">#Sunfounder</a>&#39;s quadruped does not disappoint! <a href="https://twitter.com/hashtag/robots?src=hash">#robots</a> <a href="https://t.co/mwSyxoZmUp">https://t.co/mwSyxoZmUp</a></p>&mdash; Shane Celis (@shanecelis) <a href="https://twitter.com/shanecelis/status/619163322961801216">July 9, 2015</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I was very impressed with the quadruped's performance.  The gait matched what [Sunfounder shows in their video](http://www.sunfounder.com/index.php?c=blogcs&a=details&id=46&memberid=1) and it works on both hard wood and carpet.  The servos make pleasant hum-and-whine sounds---you know, like a real robot.

# Verdict

I highly recommend this kit.  It's an amazing deal.  [I purchased this kit](http://www.sunfounder.com/index.php?c=showcs&id=99&model=Crawling%20Quadruped%20Robot) from Sunfounder for about $160, which seems like a steal.  I've seen a quadruped chassis---i.e., minus brains, servos, and transmitters---cost that much.  For some products the transmitter alone is nearly that much.  The fact that this kit is open source just puts this way over the top.  You could integrate [distance sensors](http://www.sunfounder.com/index.php?c=showcs&id=43&model=HC-SR04&pname=Arduino&name=Module&pid=21) and make it walk around autonomously.  And if you don't, you can be sure that someone else will!

I, for one, welcome our four-legged Overlords.

If you build or mod a Sunfounder quadruped, please let me know on twitter [@shanecelis](https://twitter.com/shanecelis).
