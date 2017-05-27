/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "interests")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Interests.findAll", query = "SELECT i FROM Interests i"),
    @NamedQuery(name = "Interests.findByInterestId", query = "SELECT i FROM Interests i WHERE i.interestId = :interestId"),
    @NamedQuery(name = "Interests.findByName", query = "SELECT i FROM Interests i WHERE i.name = :name")})
public class Interests implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "interest_id")
    private Integer interestId;
    @Column(name = "name")
    private String name;
    @JoinTable(name = "member_interest", joinColumns = {
        @JoinColumn(name = "interest_id", referencedColumnName = "interest_id")}, inverseJoinColumns = {
        @JoinColumn(name = "member_id", referencedColumnName = "member_id")})
    @ManyToMany
    private Collection<Members> membersCollection;

    public Interests() {
    }

    public Interests(Integer interestId) {
        this.interestId = interestId;
    }

    public Integer getInterestId() {
        return interestId;
    }

    public void setInterestId(Integer interestId) {
        this.interestId = interestId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public Collection<Members> getMembersCollection() {
        return membersCollection;
    }

    public void setMembersCollection(Collection<Members> membersCollection) {
        this.membersCollection = membersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (interestId != null ? interestId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Interests)) {
            return false;
        }
        Interests other = (Interests) object;
        if ((this.interestId == null && other.interestId != null) || (this.interestId != null && !this.interestId.equals(other.interestId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Interests[ interestId=" + interestId + " ]";
    }

}
