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
            try {
                novo = new VendaProduto(ID,quantidade);
            } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(novo != null) {
                vendaProduto.add(novo);
            }
        }
        
    }
    public int getQuantidade(){
        return vendaProduto.size();
    }
    public boolean encerrarCompra(){
        return true;
    }
}
