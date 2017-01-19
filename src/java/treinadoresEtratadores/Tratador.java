/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package treinadoresEtratadores;

/**
 *
 * @author matheus
 */
public class Tratador{
    private boolean gerente;//se true o tratador vira gerente
    public Tratador(boolean gerente){
        this.gerente=gerente;
    }
    public boolean isGerente() {
        return gerente;
    }

    public void setGerente(boolean tipo) {
        this.gerente = tipo;
    }
    
    
}
