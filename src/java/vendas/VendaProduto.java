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

/**
 *
 * @author matheus
 */
public class VendaProduto {
    private Produto produt;
    private int idProduto,quantidade;
    
    public int getIdProduto(){
        return this.idProduto;
    }
    
    public VendaProduto(int idProduto, int quantidade) throws SQLException, IllegalAccessException, InstantiationException{
        this.quantidade = quantidade;
        this.idProduto = idProduto;
        ResultSet rs;
        Access db = new Access();
        String query = "SELECT * FROM produto WHERE ID =\'" + idProduto + "\'";
        rs = db.selectSQL(query);
        if(rs.next()){
            rs = db.selectSQL(query);
            if(rs.next()){
                idProduto = Integer.parseInt(rs.getString("ID"));
                String nome = rs.getString("nome");
                float preco = Float.parseFloat(rs.getString("preco"));
                String description = rs.getString("descricao");
                String ImgPath = rs.getString("galeria_id");
                query = "SELECT * FROM galeria where id="+ImgPath;
                rs = db.selectSQL(query);
                if(rs.next()){
                    ImgPath=rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao");
                } else{
                    ImgPath="default.png";
                }
                produt = new Produto(idProduto,nome,description,ImgPath,preco);
            }
        }
    }

    public Produto getProduto() {
        return produt;
    }

    public void setProduto(Produto produt) {
        this.produt = produt;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public void incQuantidade(int quantidade) {
        this.quantidade += quantidade; 
    }
    
}
