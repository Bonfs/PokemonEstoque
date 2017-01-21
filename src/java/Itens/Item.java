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
public class Item {
    private int ID;
    private String descricao, nome, imgPath;
    public Item(int ID,String descricao,String nome,String imgPath){
        this.ID= ID;
        this.descricao= descricao;
        this.nome= nome;
        this.imgPath= imgPath;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String description) {
        this.descricao = description;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
