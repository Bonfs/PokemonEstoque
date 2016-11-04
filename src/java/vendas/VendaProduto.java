/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

import treinadoresEtratadores.Pokemon;

/**
 *
 * @author matheus
 */
public class VendaProduto {
    private Pokemon poke;
    private int pokemon_ID;
    private int quantidade;
    
    private VendaProduto(){}
    
    public VendaProduto(Pokemon poke, int quantidade){
        this.poke = poke;
        this.quantidade = quantidade;
    }

    public Pokemon getPoke() {
        return poke;
    }

    public void setPoke(Pokemon poke) {
        this.poke = poke;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
