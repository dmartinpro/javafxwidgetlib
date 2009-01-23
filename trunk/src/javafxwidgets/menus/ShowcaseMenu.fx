/*
 * ShowcaseMenu.fx
 *
 * Created on 16 déc. 2008, 16:10:10
 */

package javafxwidgets.menus;

import javafx.stage.*;
import javafx.scene.*;

Stage {
    title: "Menu Example"
    scene: Scene {
        width: 200
        height: 200
        content: [
            SwingMenuBar{
                menus: [
                    SwingMenu{
                        text: "File"
                        items: [
                            SwingMenuItem{
                                text: "Open File"
                                action: function(){
                                    println("Open File!")
                                }
                            }
                            SwingMenuItem{
                                text: "Save File"
                                action: function(){
                                    println("Save File!")
                                }
                            }
                        ]
                    },
                    SwingMenu{
                        text: "Edit"
                        items: [
                            SwingMenuItem{
                                text: "Copy"
                                action: function(){
                                    println("Copy!")
                                }
                            }
                            SwingMenuItem{
                                text: "Paste"
                                action: function(){
                                    println("Paste!")
                                }
                            }
                        ]
                    }
                ]
            }
        ]
    }
}
