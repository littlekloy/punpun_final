/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author kanok
 */
public class DatabaseUtil implements Serializable {

    private DataSource dts;
    private Connection conn;
    private PreparedStatement ppstmt;

    public DatabaseUtil(DataSource dts) {
        this.dts = dts;
    }

    public DatabaseUtil() {
    }

    public void connect() {
        try {
            this.conn = dts.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
