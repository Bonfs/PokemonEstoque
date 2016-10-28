/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

/**
 *
 * @author matheus
 */
public final class Estoque {
    private static final Estoque INSTANCE = new Estoque();
    
    private Estoque(){}
    
    //retorna a única instância do Estoque
    public static Estoque getInstance(){
        return INSTANCE;
    }
}
