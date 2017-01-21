/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Itens;

/**
 *
 * @author USER
 */
public class Produto extends Item{
    private float preco;
    
    public Produto(int ID,String nome,String description,String imgPath,float preco){
        super(ID,description,nome,imgPath);
        this.preco = preco;
    }
    
    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
}
