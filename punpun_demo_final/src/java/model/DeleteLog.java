/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "delete_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DeleteLog.findAll", query = "SELECT d FROM DeleteLog d"),
    @NamedQuery(name = "DeleteLog.findByDeleteLogID", query = "SELECT d FROM DeleteLog d WHERE d.deleteLogID = :deleteLogID"),
    @NamedQuery(name = "DeleteLog.findByDate", query = "SELECT d FROM DeleteLog d WHERE d.date = :date"),
    @NamedQuery(name = "DeleteLog.findByReason", query = "SELECT d FROM DeleteLog d WHERE d.reason = :reason")})
public class DeleteLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "deleteLogID")
    private Integer deleteLogID;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Column(name = "reason")
    private String reason;
    @JoinColumn(name = "projectID", referencedColumnName = "project_id")
    @ManyToOne(optional = false)
    private Projects projectID;
    @JoinColumn(name = "memberID", referencedColumnName = "member_id")
    @ManyToOne(optional = false)
    private Members memberID;

    public DeleteLog() {
    }

    public DeleteLog(Integer deleteLogID) {
        this.deleteLogID = deleteLogID;
    }

    public Integer getDeleteLogID() {
        return deleteLogID;
    }

    public void setDeleteLogID(Integer deleteLogID) {
        this.deleteLogID = deleteLogID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Projects getProjectID() {
        return projectID;
    }

    public void setProjectID(Projects projectID) {
        this.projectID = projectID;
    }

    public Members getMemberID() {
        return memberID;
    }

    public void setMemberID(Members memberID) {
        this.memberID = memberID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (deleteLogID != null ? deleteLogID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DeleteLog)) {
            return false;
        }
        DeleteLog other = (DeleteLog) object;
        if ((this.deleteLogID == null && other.deleteLogID != null) || (this.deleteLogID != null && !this.deleteLogID.equals(other.deleteLogID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.DeleteLog[ deleteLogID=" + deleteLogID + " ]";
    }

}
