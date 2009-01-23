/*
 * Showcase.fx
 *
 * Created on 16 déc. 2008, 14:34:37
 */

package javafxwidgets;

import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingLabel;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafxwidgets.misc.SwingProgressBar;

/**
 * @author E003530
 */

var progress = 0;

Timeline {
    repeatCount: Timeline.INDEFINITE
    keyFrames: [
        KeyFrame {
            time: 5s
            canSkip: true
            values: [
                progress => 10 tween Interpolator.LINEAR
            ]
        }
    ]
}.play();

Stage {
    title: "Progress Bar Example"
    scene: Scene {
        width: 220
        height: 150
        content: [
            SwingLabel{
                text: bind "Progress: {progress}"
            },
            SwingProgressBar{
                translateY: 50
                min: 0
                max: 10
                value: bind progress
            }
        ]
    }
}
