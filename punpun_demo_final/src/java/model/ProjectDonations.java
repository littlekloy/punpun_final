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
@Table(name = "project_donations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProjectDonations.findAll", query = "SELECT p FROM ProjectDonations p"),
    @NamedQuery(name = "ProjectDonations.findByDonationId", query = "SELECT p FROM ProjectDonations p WHERE p.donationId = :donationId"),
    @NamedQuery(name = "ProjectDonations.findByDate", query = "SELECT p FROM ProjectDonations p WHERE p.date = :date"),
    @NamedQuery(name = "ProjectDonations.findByAmount", query = "SELECT p FROM ProjectDonations p WHERE p.amount = :amount")})
public class ProjectDonations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "donation_id")
    private Integer donationId;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Basic(optional = false)
    @Column(name = "amount")
    private float amount;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id")
    @ManyToOne(optional = false)
    private Projects projectId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;
    @JoinColumn(name = "guest_id", referencedColumnName = "guest_id")
    @ManyToOne
    private Guests guestId;

    public ProjectDonations() {
    }

    public ProjectDonations(Integer donationId) {
        this.donationId = donationId;
    }

    public ProjectDonations(Integer donationId, float amount) {
        this.donationId = donationId;
        this.amount = amount;
    }

    public Integer getDonationId() {
        return donationId;
    }

    public void setDonationId(Integer donationId) {
        this.donationId = donationId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
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

    public Guests getGuestId() {
        return guestId;
    }

    public void setGuestId(Guests guestId) {
        this.guestId = guestId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (donationId != null ? donationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectDonations)) {
            return false;
        }
        ProjectDonations other = (ProjectDonations) object;
        if ((this.donationId == null && other.donationId != null) || (this.donationId != null && !this.donationId.equals(other.donationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProjectDonations[ donationId=" + donationId + " ]";
    }

}
