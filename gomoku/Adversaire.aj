package gomoku;

import gomoku.core.Player;
import gomoku.ui.App;
import javafx.scene.paint.Color;
import org.aspectj.lang.annotation.Around;

public aspect Adversaire {
    // On creer 2 joueurs
    public Player p0 = new Player("Mr. Green", Color.GREEN);
    public Player p1 = new Player("Mr. Blue", Color.BLUE);

    // Selecteur de joueur
    public int tourJoueur = 0;

    // A chaque fois que l'on place un pion on cherche le joueur actif
    // Pour cela on surcharge la methode getCurrentPlayer
    // pour renvoyer les joueur a tour de role
    pointcut playerChoice() : execution(private Player App.getCurrentPlayer());


    Player around() : playerChoice(){
        Player t;
        if(tourJoueur == 0){
            tourJoueur = 1;
            t = p0;
        }
        else {
            tourJoueur = 0;
            t = p1;
        }
        return t;
    }

}
