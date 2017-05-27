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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "address")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Address.findAll", query = "SELECT a FROM Address a"),
    @NamedQuery(name = "Address.findByAddressLine", query = "SELECT a FROM Address a WHERE a.addressLine = :addressLine"),
    @NamedQuery(name = "Address.findBySubdistrict", query = "SELECT a FROM Address a WHERE a.subdistrict = :subdistrict"),
    @NamedQuery(name = "Address.findByDistrict", query = "SELECT a FROM Address a WHERE a.district = :district"),
    @NamedQuery(name = "Address.findByProvice", query = "SELECT a FROM Address a WHERE a.provice = :provice"),
    @NamedQuery(name = "Address.findByCountry", query = "SELECT a FROM Address a WHERE a.country = :country"),
    @NamedQuery(name = "Address.findByPostcode", query = "SELECT a FROM Address a WHERE a.postcode = :postcode"),
    @NamedQuery(name = "Address.findByMemberId", query = "SELECT a FROM Address a WHERE a.memberId = :memberId")})
public class Address implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "address_line")
    private String addressLine;
    @Column(name = "subdistrict")
    private String subdistrict;
    @Column(name = "district")
    private String district;
    @Column(name = "provice")
    private String provice;
    @Column(name = "country")
    private String country;
    @Column(name = "postcode")
    private String postcode;
    @Id
    @Basic(optional = false)
    @Column(name = "member_id")
    private Integer memberId;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Members members;

    public Address() {
    }

    public Address(Integer memberId) {
        this.memberId = memberId;
    }

    public String getAddressLine() {
        return addressLine;
    }

    public void setAddressLine(String addressLine) {
        this.addressLine = addressLine;
    }

    public String getSubdistrict() {
        return subdistrict;
    }

    public void setSubdistrict(String subdistrict) {
        this.subdistrict = subdistrict;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvice() {
        return provice;
    }

    public void setProvice(String provice) {
        this.provice = provice;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Members getMembers() {
        return members;
    }

    public void setMembers(Members members) {
        this.members = members;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (memberId != null ? memberId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Address)) {
            return false;
        }
        Address other = (Address) object;
        if ((this.memberId == null && other.memberId != null) || (this.memberId != null && !this.memberId.equals(other.memberId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Address[ memberId=" + memberId + " ]";
    }

}
