/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package treinadoresEtratadores;

import Itens.Pokemon;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vendas.Carrinho;
import vendas.Estoque;
public class Treinador extends Usuario{
    private Carrinho carrinho = new Carrinho(getID());
    private Estoque bolsa = new Estoque(getID());
    public Carrinho getCarrinho() {
        return carrinho;
    }
    private String nomeDaMae;
    
    public Treinador(int ID,long CPF,String login,String senha,String nome,String email,String cidade,String endereco,String telefone,String nomeDaMae){
        super(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,false);
        this.nomeDaMae = nomeDaMae;
    }
    public void atualizaBolsa(){
        try {
            bolsa.AtualizaEstoque(getID());
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(Treinador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Pokemon> getPokemons(){
        return bolsa.getPokemons();
    }
    public Pokemon getPokemon(int id){
        return bolsa.getPokemon(id);
    }
    public String getNomeDaMae() {
        return nomeDaMae;
    }

    public void setNomeDaMae(String nomeDaMae) {
        this.nomeDaMae = nomeDaMae;
    }
    
}
