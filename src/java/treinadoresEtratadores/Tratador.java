/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package treinadoresEtratadores;

/**
 *
 * @author matheus
 */
public class Tratador extends Usuario{
    private boolean gerente;//se true o tratador vira gerente
    public Tratador(int ID,long CPF,String login,String senha,String nome,String email,String cidade,String endereco,String telefone,boolean gerente){
        super(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,true);
        this.gerente=gerente;
    }
    public boolean isGerente() {
        return gerente;
    }
    public void setGerente(boolean tipo) {
        this.gerente = tipo;
    }
    
    
}
