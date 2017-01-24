package Itens;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author matheus
 */
public class Pokemon extends Item{
    private int id_treinador,nivel;
    private String tipo;
    public Pokemon(int ID,String nome,String description,String imgPath,String tipo,int nivel,int id_Treinador){
        super(ID,description,nome,imgPath);
        this.id_treinador = id_Treinador;
        this.tipo = tipo;
        this.nivel = nivel;
    }
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public void setId_treinador(int id_treinador) {
        this.id_treinador = id_treinador;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getId_treinador() {
        return id_treinador;
    }

    public int getNivel() {
        return nivel;
    }
}
