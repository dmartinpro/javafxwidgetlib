/*
 * SwingProgressBar.fx
 *
 * Created on 16 déc. 2008, 14:36:57
 */

package javafxwidgets.misc;

import javafx.ext.swing.SwingComponent;
import javax.swing.JProgressBar;

/**
 * @author David MARTIN
 */

public class SwingProgressBar extends SwingComponent {

    var progressBar: JProgressBar;

    public var tooltipText: String;

    public var text:String on replace {
        progressBar.setString(text);
        progressBar.setStringPainted(true);
    };

    public var min:Integer = 0 on replace {
        progressBar.setMinimum(min)
    };

    public var max:Integer = 100 on replace {
        progressBar.setMaximum(max)
    };

    public var value:Integer = 0 on replace {
        progressBar.setValue(value);
    };

    public override function createJComponent() {
        progressBar = new JProgressBar(0, 100);
        progressBar.setToolTipText(tooltipText);
        return progressBar;
    }

}
