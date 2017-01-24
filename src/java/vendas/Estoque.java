/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

import Itens.*;
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
    private List<Pokemon> estoquePokemon;
    
    
    public void AtualizaEstoque(int id) throws SQLException, IllegalAccessException, InstantiationException{
        this.estoqueQuantidade = new ArrayList<Integer>();
        if(id==0)
            this.estoqueProduto = new ArrayList<Produto>();
        else 
            this.estoquePokemon = new ArrayList<Pokemon>();
        String Resultado="";
        ResultSet rs = null;
        Access db = new Access();
        String query = "";
        if(id==0)
            query="SELECT * FROM produto";
        else
            query="SELECT * FROM pokemon where id_Treinador ="+id;
        rs = db.selectSQL(query);
        while(rs != null && rs.next()){
            int ID = Integer.parseInt(rs.getString("ID"));
            String nome = rs.getString("nome");
            String descricao = rs.getString("descricao");
            String ImgPath = rs.getString("galeria_id");
            if(id==0){
                float preco = Float.parseFloat(rs.getString("preco"));
                Produto produt = new Produto(ID,nome,descricao,ImgPath,preco);
                estoqueProduto.add(produt);
            }else{
                String tipo = rs.getString("tipo");
                int nivel = Integer.parseInt(rs.getString("nivel"));
                Pokemon poke = new Pokemon(ID,nome,descricao,ImgPath,tipo,nivel,id);
                estoquePokemon.add(poke);
            }
        }
        if(id==0){
            for(Produto produto : estoqueProduto){
                query = "SELECT * FROM galeria where id="+produto.getImgPath();
                rs = db.selectSQL(query);
                if(rs.next()){
                    produto.setImgPath(rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao"));
                } else{
                    produto.setImgPath("default.png");
                }
            }
        }else{
             for(Pokemon produto : estoquePokemon){
                query = "SELECT * FROM galeria where id="+produto.getImgPath();
                rs = db.selectSQL(query);
                if(rs.next()){
                    produto.setImgPath(rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao"));
                } else{
                    produto.setImgPath("default.png");
                }
            }           
        }
        if(id==0){
            for(Item produto : estoqueProduto){
                query = "SELECT quantidade as q FROM estoque_produto where produto_id="+produto.getID();
                rs = db.selectSQL(query);
                System.out.println(rs.getString("q"));
                estoqueQuantidade.add(Integer.parseInt(rs.getString("q")));
            }
        }else{
            for(Item produto : estoquePokemon){
                /*query = "SELECT quantidade as q FROM estoque_produto where produto_id="+produto.getID();
                rs = db.selectSQL(query);
                System.out.println(rs.getString("q"));*/
                estoqueQuantidade.add(1);
            }
        }
        
        db.connectionClose();
    }
    public Estoque(int id){
        try{
            AtualizaEstoque(id);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(Estoque.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Estoque(){
        try{
            AtualizaEstoque(0);
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
    public List<Pokemon> getPokemons(){
        return this.estoquePokemon;
    }
    public Pokemon getPokemon(int id){
        return estoquePokemon.get(id);
    }
}
