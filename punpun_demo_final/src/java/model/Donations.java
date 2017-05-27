/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "donations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Donations.findAll", query = "SELECT d FROM Donations d"),
    @NamedQuery(name = "Donations.findByDonationId", query = "SELECT d FROM Donations d WHERE d.donationId = :donationId"),
    @NamedQuery(name = "Donations.findByAmount", query = "SELECT d FROM Donations d WHERE d.amount = :amount"),
    @NamedQuery(name = "Donations.findByDate", query = "SELECT d FROM Donations d WHERE d.date = :date"),
    @NamedQuery(name = "Donations.findByType", query = "SELECT d FROM Donations d WHERE d.type = :type"),
    @NamedQuery(name = "Donations.findByMethod", query = "SELECT d FROM Donations d WHERE d.method = :method"),
    @NamedQuery(name = "Donations.findByStatus", query = "SELECT d FROM Donations d WHERE d.status = :status")})
public class Donations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "donation_id")
    private Integer donationId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private Float amount;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Column(name = "type")
    private String type;
    @Column(name = "method")
    private String method;
    @Column(name = "status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "donationId")
    private Collection<ItemDonations> itemDonationsCollection;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id")
    @ManyToOne(optional = false)
    private Projects projectId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;
    @JoinColumn(name = "guest_id", referencedColumnName = "guest_id")
    @ManyToOne
    private Guests guestId;

    public Donations() {
    }

    public Donations(Integer donationId) {
        this.donationId = donationId;
    }

    public Integer getDonationId() {
        return donationId;
    }

    public void setDonationId(Integer donationId) {
        this.donationId = donationId;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<ItemDonations> getItemDonationsCollection() {
        return itemDonationsCollection;
    }

    public void setItemDonationsCollection(Collection<ItemDonations> itemDonationsCollection) {
        this.itemDonationsCollection = itemDonationsCollection;
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
        if (!(object instanceof Donations)) {
            return false;
        }
        Donations other = (Donations) object;
        if ((this.donationId == null && other.donationId != null) || (this.donationId != null && !this.donationId.equals(other.donationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Donations[ donationId=" + donationId + " ]";
    }

}
