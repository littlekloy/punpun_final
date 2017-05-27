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
@Table(name = "edit_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EditLog.findAll", query = "SELECT e FROM EditLog e"),
    @NamedQuery(name = "EditLog.findByEditLogId", query = "SELECT e FROM EditLog e WHERE e.editLogId = :editLogId"),
    @NamedQuery(name = "EditLog.findByDate", query = "SELECT e FROM EditLog e WHERE e.date = :date")})
public class EditLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "edit_log_id")
    private Integer editLogId;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id")
    @ManyToOne
    private Projects projectId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;

    public EditLog() {
    }

    public EditLog(Integer editLogId) {
        this.editLogId = editLogId;
    }

    public Integer getEditLogId() {
        return editLogId;
    }

    public void setEditLogId(Integer editLogId) {
        this.editLogId = editLogId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Projects getProjectId() {
        return projectId;
    }

    public void setProjectId(Projects projectId) {
        this.projectId = projectId;
    }

    public Members getMemberId() {
        return memberId;
    }

    public void setMemberId(Members memberId) {
        this.memberId = memberId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (editLogId != null ? editLogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EditLog)) {
            return false;
        }
        EditLog other = (EditLog) object;
        if ((this.editLogId == null && other.editLogId != null) || (this.editLogId != null && !this.editLogId.equals(other.editLogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.EditLog[ editLogId=" + editLogId + " ]";
    }

}
