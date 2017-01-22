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
    
    public Treinador(int ID,long CPF,String login,String senha,String nome,String email,String cidade,String endereco,String telefone,String nomeDaMae){
        super(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,false);
        this.nomeDaMae = nomeDaMae;
    }
    public String getNomeDaMae() {
        return nomeDaMae;
    }

    public void setNomeDaMae(String nomeDaMae) {
        this.nomeDaMae = nomeDaMae;
    }
    
}
