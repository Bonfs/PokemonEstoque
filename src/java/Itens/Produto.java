/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Itens;

import java.text.DecimalFormat;

/**
 *
 * @author USER
 */
public class Produto extends Item{
    private float preco;
    public Produto(){
        super(0,"","","");
    }
    public Produto(int ID,String nome,String description,String imgPath,float preco){
        super(ID,description,nome,imgPath);
        this.preco = preco;
    }
    public String getPrecoString(float preco) {
        return new DecimalFormat("#.00").format(preco);
    }
    public String getPrecoString() {
        return new DecimalFormat("#.00").format(preco);
    }
    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }
}
