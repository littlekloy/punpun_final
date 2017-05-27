/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "item_donations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ItemDonations.findAll", query = "SELECT i FROM ItemDonations i"),
    @NamedQuery(name = "ItemDonations.findByItemDonationId", query = "SELECT i FROM ItemDonations i WHERE i.itemDonationId = :itemDonationId"),
    @NamedQuery(name = "ItemDonations.findByAmount", query = "SELECT i FROM ItemDonations i WHERE i.amount = :amount")})
public class ItemDonations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "item_donation_id")
    private Integer itemDonationId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private Float amount;
    @JoinColumns({
        @JoinColumn(name = "project_id", referencedColumnName = "project_id"),
        @JoinColumn(name = "item_id", referencedColumnName = "item_id")})
    @ManyToOne(optional = false)
    private ProjectItems projectItems;
    @JoinColumn(name = "donation_id", referencedColumnName = "donation_id")
    @ManyToOne(optional = false)
    private Donations donationId;

    public ItemDonations() {
    }

    public ItemDonations(Integer itemDonationId) {
        this.itemDonationId = itemDonationId;
    }

    public Integer getItemDonationId() {
        return itemDonationId;
    }

    public void setItemDonationId(Integer itemDonationId) {
        this.itemDonationId = itemDonationId;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public ProjectItems getProjectItems() {
        return projectItems;
    }

    public void setProjectItems(ProjectItems projectItems) {
        this.projectItems = projectItems;
    }

    public Donations getDonationId() {
        return donationId;
    }

    public void setDonationId(Donations donationId) {
        this.donationId = donationId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemDonationId != null ? itemDonationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemDonations)) {
            return false;
        }
        ItemDonations other = (ItemDonations) object;
        if ((this.itemDonationId == null && other.itemDonationId != null) || (this.itemDonationId != null && !this.itemDonationId.equals(other.itemDonationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ItemDonations[ itemDonationId=" + itemDonationId + " ]";
    }

}
