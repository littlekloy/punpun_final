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
@Table(name = "update_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UpdateLog.findAll", query = "SELECT u FROM UpdateLog u"),
    @NamedQuery(name = "UpdateLog.findByUpdateLogId", query = "SELECT u FROM UpdateLog u WHERE u.updateLogId = :updateLogId"),
    @NamedQuery(name = "UpdateLog.findByAcitivityDate", query = "SELECT u FROM UpdateLog u WHERE u.acitivityDate = :acitivityDate"),
    @NamedQuery(name = "UpdateLog.findByDetail", query = "SELECT u FROM UpdateLog u WHERE u.detail = :detail"),
    @NamedQuery(name = "UpdateLog.findByDate", query = "SELECT u FROM UpdateLog u WHERE u.date = :date")})
public class UpdateLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "update_log_id")
    private Integer updateLogId;
    @Column(name = "acitivity_date")
    @Temporal(TemporalType.DATE)
    private Date acitivityDate;
    @Column(name = "detail")
    private String detail;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id")
    @ManyToOne
    private Projects projectId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;

    public UpdateLog() {
    }

    public UpdateLog(Integer updateLogId) {
        this.updateLogId = updateLogId;
    }

    public Integer getUpdateLogId() {
        return updateLogId;
    }

    public void setUpdateLogId(Integer updateLogId) {
        this.updateLogId = updateLogId;
    }

    public Date getAcitivityDate() {
        return acitivityDate;
    }

    public void setAcitivityDate(Date acitivityDate) {
        this.acitivityDate = acitivityDate;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
        hash += (updateLogId != null ? updateLogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UpdateLog)) {
            return false;
        }
        UpdateLog other = (UpdateLog) object;
        if ((this.updateLogId == null && other.updateLogId != null) || (this.updateLogId != null && !this.updateLogId.equals(other.updateLogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.UpdateLog[ updateLogId=" + updateLogId + " ]";
    }

}
