/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author matheus
 */
public class Carrinho {
    private Date dataDeVenda;
    private int idTreinador;
    ArrayList<VendaProduto> vendaProduto;
    public ArrayList<VendaProduto> getLista(){
        return this.vendaProduto;
    }
    public Carrinho(int codTreinador){
        this.vendaProduto = new ArrayList();
        idTreinador = codTreinador;
    }
    public void setProduto(int ID,int quantidade){
        VendaProduto novo = null;
        int IdEncontrado = -1;
        for (VendaProduto produto:vendaProduto){
            if(produto.getIdProduto() == ID)
                IdEncontrado = vendaProduto.indexOf(produto);
        }
        
        if(IdEncontrado != -1){
            vendaProduto.get(IdEncontrado).incQuantidade(quantidade);
        }else{
            novo = new VendaProduto(ID,quantidade);
            if(novo != null) {
                vendaProduto.add(novo);
            }
        }
    }
    public void alterProduto(int ID,int quantidade){
        if(ID >= 0){
            vendaProduto.get(ID).alterQuantidade(quantidade);
        }
    }
    public void removeProduto(int ID){
        if(ID >= 0){
            vendaProduto.remove(ID);
        }
    }
    public int getQuantidade(){
        return vendaProduto.size();
    }
    public boolean encerrarCompra(){
        return true;
    }
}
