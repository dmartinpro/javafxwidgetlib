/*
 * SwingMenu.fx
 *
 * Created on 16 déc. 2008, 16:03:52
 */

package javafxwidgets.menus;

import javafx.ext.swing.SwingComponent;
import javax.swing.JMenu;

/**
 * @author David MARTIN
 */
public class SwingMenu extends SwingComponent {

    package var menu: JMenu;

    public var text: String on replace {
        menu.setText(text);
    }

    public var items:SwingMenuItem[] on replace {
        for (item in items) {
            menu.add(item.menuItem);
        }
    }

    public var menus:SwingMenu[] on replace {
        for (m in menus) {
            menu.add(m.menu);
        }
    }

    public override function createJComponent() {
        menu = new JMenu();
        return menu;
    }
}
