package gomoku;

import gomoku.core.model.Spot;
import gomoku.ui.App;
import javafx.event.EventHandler;
import javafx.scene.input.MouseEvent;

public aspect FinJeu {
    static boolean fin = false;


    // Lorsque le jeu est gagné on passe le boolean fin à true
    pointcut FinDuJeu() : execution(public void gameOver(gomoku.core.Player));
    after() : FinDuJeu(){
        fin = true;
    }

    // On surcharge la methode ajouter un pion quand la partie est finie de façon à se qu'il ne soit plus possible de jouer
    pointcut block() : execution(private void App.makeMove(Spot)) && if(fin);
    void around() : block() {
    }

}
