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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import model.Notifications;

/**
 *
 * @author kanok
 */
public class NotificationUtil {

    private DataSource ds;
    private Connection conn;
    private PreparedStatement insertData;
    private PreparedStatement selectData;

    public NotificationUtil() {
    }

    public NotificationUtil(DataSource ds) {
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

    public ArrayList<Notifications> findAllNotification(String id) {
        String cmd = "select * from notifications where member_id = ?";
        ArrayList<Notifications> notifications = new ArrayList<Notifications>();
        try {
            selectData = conn.prepareStatement(cmd);

            selectData.setString(1, id);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Notifications noti = new Notifications();
                noti.setAction(rs.getString("action"));
                noti.setActor(rs.getString("actor"));
                noti.setNotificationId(rs.getInt("notification_id"));
                noti.setDetail(rs.getString("detail"));
                noti.setChecked(rs.getInt("checked"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(NotificationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

}
