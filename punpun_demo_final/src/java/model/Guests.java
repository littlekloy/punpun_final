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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "guests")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Guests.findAll", query = "SELECT g FROM Guests g"),
    @NamedQuery(name = "Guests.findByGuestId", query = "SELECT g FROM Guests g WHERE g.guestId = :guestId"),
    @NamedQuery(name = "Guests.findByFirstName", query = "SELECT g FROM Guests g WHERE g.firstName = :firstName"),
    @NamedQuery(name = "Guests.findByLastName", query = "SELECT g FROM Guests g WHERE g.lastName = :lastName"),
    @NamedQuery(name = "Guests.findByEmail", query = "SELECT g FROM Guests g WHERE g.email = :email")})
public class Guests implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "guest_id")
    private Integer guestId;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @OneToMany(mappedBy = "guestId")
    private Collection<Donations> donationsCollection;
    @OneToMany(mappedBy = "guestId")
    private Collection<ProjectDonations> projectDonationsCollection;

    public Guests() {
    }

    public Guests(Integer guestId) {
        this.guestId = guestId;
    }

    public Guests(Integer guestId, String firstName, String lastName, String email) {
        this.guestId = guestId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    public Integer getGuestId() {
        return guestId;
    }

    public void setGuestId(Integer guestId) {
        this.guestId = guestId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public Collection<Donations> getDonationsCollection() {
        return donationsCollection;
    }

    public void setDonationsCollection(Collection<Donations> donationsCollection) {
        this.donationsCollection = donationsCollection;
    }

    @XmlTransient
    public Collection<ProjectDonations> getProjectDonationsCollection() {
        return projectDonationsCollection;
    }

    public void setProjectDonationsCollection(Collection<ProjectDonations> projectDonationsCollection) {
        this.projectDonationsCollection = projectDonationsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (guestId != null ? guestId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Guests)) {
            return false;
        }
        Guests other = (Guests) object;
        if ((this.guestId == null && other.guestId != null) || (this.guestId != null && !this.guestId.equals(other.guestId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Guests[ guestId=" + guestId + " ]";
    }

}
