package dbAccess;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Access {
    private Connection connection = null;
    private Statement statement = null;
    
    public Access(){
        URL url = getClass().getResource("pokeBD.db");
        String urls = url.toString();
        try {
            Class.forName("org.sqlite.JDBC");
            this.connection = DriverManager.getConnection("jdbc:sqlite:"+urls);
            this.statement = connection.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(Access.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Access.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void connectionClose(){
        try {
            this.statement.close();
            this.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Access.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public StringBuilder SelectSQL(String Select,int isString) throws SQLException,InstantiationException, IllegalAccessException {
            //Statement statement = null;
            ResultSet rs = null;
            List novo = new ArrayList();
            
            statement = this.connection.createStatement();
            rs = statement.executeQuery(Select);
            int length = rs.getMetaData().getColumnCount();
            StringBuilder vetor = new StringBuilder();
            if(length>0)
            while (rs.next()) {
                //if(length>1)
                    //vetor.append('[');
                for(int i = 1;i<=length;i++){
                    if(isString == 1)
                        vetor.append("\"");
                    vetor.append(rs.getString(i));
                    if(isString == 1)
                        vetor.append("\"");
                    if(i < length)
                    vetor.append(',');
                }
                if(length<1){
                    vetor.setCharAt(vetor.length()-1, ']');
                    //vetor.append(',');
                }
                //vetor.setCharAt(vetor.length()-1, ',');
            }  
            /*if(length>1){
                vetor.setCharAt(vetor.length()-1, ']');
            }else
                vetor.setCharAt(vetor.length()-1, ' ');*/
            novo.add(vetor); 
            vetor = new StringBuilder();
            rs.close();
            this.connectionClose();
         return sqlStringToVector(novo);
}
    
    private StringBuilder sqlStringToVector(List<String> Lista){
        StringBuilder sb = new StringBuilder();
        //sb.append('[');
        sb.append(Lista);
        //sb.setCharAt(sb.length()-1, ' ');
        for(int i=0;i<sb.length();i++){
            if(i > 1 && sb.charAt(i) == ' ' &&  (sb.charAt(i-1) == '\"' || sb.charAt(i-1) == ']' )){
                sb.setCharAt(i, ',');
            }else if(sb.charAt(i) == '(')
                sb.setCharAt(i, '[');
            else if (sb.charAt(i) == ')'){
                sb.setCharAt(i, ']');
                if(sb.charAt(i+1) == ')')
                    if(i+3 < sb.length()-1 && sb.charAt(i+3) != ','){
                        if(sb.charAt(i+3) == '[')
                        sb.setCharAt(i+2, ']');
                        sb.setCharAt(i+2, ',');
                    }
                    
            }
            
        }
        if(sb.charAt(sb.length()-1) == ','){
            sb.delete(sb.length()-1,1);
        }
        return sb;
    }

    public ResultSet selectSQL(String query) throws SQLException, IllegalAccessException, InstantiationException {    
            ResultSet rs = null;
            rs = statement.executeQuery(query);
            
            return rs;
    }
    public ResultSet insertSQL(String query) throws SQLException, IllegalAccessException, InstantiationException {    
            ResultSet rs = null;
            statement.executeUpdate(query);
            rs = statement.executeQuery("SELECT last_insert_rowid() as ID;");
            return rs;
    }
       
}
