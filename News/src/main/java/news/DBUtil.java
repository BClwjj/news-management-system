package news;

import java.sql.*;

public class DBUtil {
    Connection conn=null;
    Statement stat=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    /**
     * 寰楀埌杩炴帴
     */
    public Connection getConn(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/news","root","Luhan0420");
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }
    /**
     * 鍏抽棴杩炴帴鍥炴敹璧勬簮
     */
    public void release(){
        try {
            if(rs!=null)
                rs.close();
            if(stat!=null)
                stat.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    //鏌ヨ
    public ResultSet getResult(String sql,String []args){
        rs=null;
        if(conn==null){
            conn=this.getConn();
        }
        try {
            ps=conn.prepareStatement(sql);
            for (int i=0;i<args.length;i++) {
                ps.setString(i+1,args[i]);//鍙傛暟浠�1寮�濮�
            }
            //4.鎵цsql璇彞锛岀敓鎴恟esultset缁撴灉,骞舵墦鍗�
            rs=ps.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }
    public ResultSet getResult(String sql){
        rs=null;
        if(conn==null){
            conn=this.getConn();
        }
        try {
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }
    //澧炲垹鏀�
    public int executeSql(String sql,String []args){
        int result=0;//sql澧炲垹鏀规椂锛岃繑鍥炵殑涓嶆槸ResultSet锛岃�屾槸int
        if(conn==null){
            conn=this.getConn();
        }
        try {
            ps=conn.prepareStatement(sql);
            for (int i=0;i<args.length;i++) {
                ps.setString(i+1,args[i]);//鍙傛暟浠�1寮�濮�
            }
            result =ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }
    //澧炲垹鏀�
    public int executeSql(String sql){
        int result=0;//sql澧炲垹鏀规椂锛岃繑鍥炵殑涓嶆槸ResultSet锛岃�屾槸int
        if(conn==null){
            conn=this.getConn();
        }
        try {
            stat=conn.createStatement();
            result =stat.executeUpdate(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }
}

