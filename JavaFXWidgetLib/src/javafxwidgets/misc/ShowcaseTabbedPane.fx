/*
 * ShowcaseTabbedPane.fx
 *
 * Created on 16 déc. 2008, 14:48:29
 */

package javafxwidgets.misc;

import javafx.ext.swing.SwingLabel;
import javafx.scene.Scene;
import javafx.stage.Stage;


Stage {
    title: "Tabbed Pane"
    scene: Scene {
        width: 300
        height: 150
        content: SwingTabbedPane {
            width: 300
            height: 150

            tabs: for(n in [1..5]) SwingTabbedPane.SwingTab{
                title: "Tab: {n}"
                content: SwingLabel {
                   text:"Label {n}"
                }

            }

        }
    }
}
