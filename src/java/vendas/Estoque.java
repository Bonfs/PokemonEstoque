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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author matheus
 */
public final class Estoque {
    private List<Integer> estoqueQuantidade;
    private List<Produto> estoqueProduto;
    
    public void AtualizaEstoque() throws SQLException, IllegalAccessException, InstantiationException{
        this.estoqueQuantidade = new ArrayList<Integer>();
        this.estoqueProduto = new ArrayList<Produto>();
        String Resultado="";
        ResultSet rs = null;
        Access db = new Access();
        String query = "SELECT * FROM produto";
        rs = db.selectSQL(query);
        while(rs != null && rs.next()){
            int ID = Integer.parseInt(rs.getString("ID"));
            String nome = rs.getString("nome");
            float preco = Float.parseFloat(rs.getString("preco"));
            String descricao = rs.getString("descricao");
            String ImgPath = rs.getString("galeria_id");
            Produto produt = new Produto(ID,nome,descricao,ImgPath,preco);
            estoqueProduto.add(produt);
        }

        for(Produto produto : estoqueProduto){
            query = "SELECT * FROM galeria where id="+produto.getImgPath();
            rs = db.selectSQL(query);
            if(rs.next()){
                produto.setImgPath(rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao"));
            } else{
                produto.setImgPath("default.png");
            }
        }
        
        for(Produto produto : estoqueProduto){
            query = "SELECT quantidade as q FROM estoque_produto where produto_id="+produto.getID();
            rs = db.selectSQL(query);
            System.out.println(rs.getString("q"));
            estoqueQuantidade.add(Integer.parseInt(rs.getString("q")));
            
        }
        db.connectionClose();
    }
    public Estoque(){
        try{
            AtualizaEstoque();
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(Estoque.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int getQuantidade(int index){
        return this.estoqueQuantidade.get(index);
    }
    public List<Integer> getQuantidades(){
        return this.estoqueQuantidade;
    }
    //retorna a única instância do Estoque
    public List<Produto> getProdutos(){
        return this.estoqueProduto;
    }
}
