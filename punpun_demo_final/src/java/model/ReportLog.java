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
@Table(name = "report_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReportLog.findAll", query = "SELECT r FROM ReportLog r"),
    @NamedQuery(name = "ReportLog.findByReportLogId", query = "SELECT r FROM ReportLog r WHERE r.reportLogId = :reportLogId"),
    @NamedQuery(name = "ReportLog.findByDate", query = "SELECT r FROM ReportLog r WHERE r.date = :date"),
    @NamedQuery(name = "ReportLog.findByReason", query = "SELECT r FROM ReportLog r WHERE r.reason = :reason")})
public class ReportLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "report_log_id")
    private Integer reportLogId;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Basic(optional = false)
    @Column(name = "reason")
    private String reason;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id")
    @ManyToOne
    private Projects projectId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;

    public ReportLog() {
    }

    public ReportLog(Integer reportLogId) {
        this.reportLogId = reportLogId;
    }

    public ReportLog(Integer reportLogId, String reason) {
        this.reportLogId = reportLogId;
        this.reason = reason;
    }

    public Integer getReportLogId() {
        return reportLogId;
    }

    public void setReportLogId(Integer reportLogId) {
        this.reportLogId = reportLogId;
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
        hash += (reportLogId != null ? reportLogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportLog)) {
            return false;
        }
        ReportLog other = (ReportLog) object;
        if ((this.reportLogId == null && other.reportLogId != null) || (this.reportLogId != null && !this.reportLogId.equals(other.reportLogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ReportLog[ reportLogId=" + reportLogId + " ]";
    }

}
