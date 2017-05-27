/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import model.Members;

/**
 *
 * @author kanok
 */
public class MemberUtil {

    private DataSource ds;
    private Connection conn;
    private PreparedStatement insertData;
    private PreparedStatement selectData;

    public MemberUtil() {
    }

    public MemberUtil(DataSource ds) {
        this.ds = ds;
    }

    public void connect() {
        try {
            this.conn = ds.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Integer insertMember(String firstName, String lastName, String email, String password) {
        String cmd = "insert into members (password, first_name, last_name, email) values (?,?,?,?)";
        try {
            insertData = conn.prepareStatement(cmd);
            insertData.setString(1, password);
            insertData.setString(2, firstName);
            insertData.setString(3, lastName);
            insertData.setString(4, email);
            System.out.println(insertData);
            return insertData.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MemberUtil.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Members findMemberByEmail(String Email) {
        String cmd = "select * from members where email = ?";
        try {
            selectData = conn.prepareStatement(cmd);
            selectData.setString(1, Email);
            ResultSet rs = selectData.executeQuery();
            if (rs.next()) {
                Members member = new Members();
                member.setEmail(rs.getString("email"));
                member.setPassword(rs.getString("password"));
                member.setFirstName(rs.getString("first_name"));
                member.setLastName(rs.getString("last_name"));
                member.setMemberId(rs.getInt("member_id"));
                return member;
            }

        } catch (SQLException ex) {
            Logger.getLogger(MemberUtil.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    public Members authenicate(String email, String password) {
        String cmdSelect = "select * from members where email = ? and password = ?";
        try {
            selectData = conn.prepareStatement(cmdSelect);
            selectData.setString(1, email);
            selectData.setString(2, password);
            System.out.println(selectData);
            ResultSet rs = selectData.executeQuery();

            if (rs.next()) {

                Members member = new Members();
                member.setEmail(rs.getString("email"));
                member.setPassword(rs.getString("password"));
                member.setFirstName(rs.getString("first_name"));
                member.setLastName(rs.getString("last_name"));
                member.setMemberId(rs.getInt("member_id"));

                return member;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
