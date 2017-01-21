/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package treinadoresEtratadores;

import vendas.Carrinho;

/**
 *
 * @author matheus
 */
public class Treinador extends Usuario{
    private Carrinho carrinho = new Carrinho(getID());

    public Carrinho getCarrinho() {
        return carrinho;
    }
    private String nomeDaMae;
    
    public Treinador(int ID,String login,String nome,String email,String endereco,String telefone,String nomeDaMae){
        super(ID,login,nome,email,endereco,telefone,false);
        this.nomeDaMae = nomeDaMae;
    }
    public String getNomeDaMae() {
        return nomeDaMae;
    }

    public void setNomeDaMae(String nomeDaMae) {
        this.nomeDaMae = nomeDaMae;
    }
    
}
