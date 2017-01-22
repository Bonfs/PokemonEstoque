/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

import Itens.Produto;
import dbAccess.Access;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.LoginServlet;

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
    private void fechaCarrinho(){
        ResultSet rs = null;
        Access db = new Access();
        String query = "INSERT INTO `venda`(`treinador_id`,`data_de_venda`) VALUES ("+this.idTreinador+",\'"+new Date(System.currentTimeMillis())+"\');";
        System.out.println(query);
        
        try {
            rs = db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            if(rs != null){
                    String ID_String = null;
                try {
                    ID_String = rs.getString("ID");
                } catch (SQLException ex) {
                    Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("Passou");
                int idVenda = Integer.parseInt(ID_String);
                
                for (VendaProduto produto : vendaProduto){
                    int quantidade = produto.getQuantidade();
                    int idProduto = produto.getProduto().getID();
                    System.out.println("pt1");
                    query = "INSERT INTO `venda_item`(`venda_id`,`produto_id`,`quantidade`) VALUES ("+idVenda+","+idProduto+","+quantidade+");";
                    System.out.println(query);
                    try {
                    db.insertSQL(query);
                    }catch (SQLException | IllegalAccessException | InstantiationException ex) {
                        Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                for (VendaProduto produto : vendaProduto){
                    int quantidade = produto.getQuantidade();
                    int idProduto = produto.getProduto().getID();
                    System.out.println("pt2");
                    query = "UPDATE estoque_produto SET quantidade=quantidade-"+quantidade+" where produto_id="+idProduto;
                    try {
                    db.insertSQL(query);
                    }catch (SQLException | IllegalAccessException | InstantiationException ex) {
                        Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        
        this.vendaProduto.clear();
        db.connectionClose();
    }
    
    public boolean encerrarCompra(){
        fechaCarrinho();
        return true;
    }
}
