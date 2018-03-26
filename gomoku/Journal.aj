package gomoku;

import gomoku.core.model.Spot;

import java.io.FileOutputStream;
import java.io.PrintStream;

public aspect Journal {

    // A la fin de chaque tour de jeu on enregistre le nom du joueur et la position de son pion.
    after(Spot s): target(s) && call(void setOccupant(..)){
        System.out.println(s.getOccupant() + " : " + s);
        String str = s.getOccupant() + " : " + s;
        try{
            FileOutputStream ff = new FileOutputStream("log.txt", true);
            PrintStream ffw=new PrintStream(ff);
            ffw.println(str);  // écrire une ligne dans le fichier resultat.txt
            ffw.close(); // fermer le fichier à la fin des traitements
        }catch (Exception e) {}
    }
}
