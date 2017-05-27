/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "members")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Members.findAll", query = "SELECT m FROM Members m"),
    @NamedQuery(name = "Members.findByMemberId", query = "SELECT m FROM Members m WHERE m.memberId = :memberId"),
    @NamedQuery(name = "Members.findByUsername", query = "SELECT m FROM Members m WHERE m.username = :username"),
    @NamedQuery(name = "Members.findByPassword", query = "SELECT m FROM Members m WHERE m.password = :password"),
    @NamedQuery(name = "Members.findByFirstName", query = "SELECT m FROM Members m WHERE m.firstName = :firstName"),
    @NamedQuery(name = "Members.findByLastName", query = "SELECT m FROM Members m WHERE m.lastName = :lastName"),
    @NamedQuery(name = "Members.findByEmail", query = "SELECT m FROM Members m WHERE m.email = :email"),
    @NamedQuery(name = "Members.findByRole", query = "SELECT m FROM Members m WHERE m.role = :role"),
    @NamedQuery(name = "Members.findByPoint", query = "SELECT m FROM Members m WHERE m.point = :point"),
    @NamedQuery(name = "Members.findByLevel", query = "SELECT m FROM Members m WHERE m.level = :level"),
    @NamedQuery(name = "Members.findByFacebookId", query = "SELECT m FROM Members m WHERE m.facebookId = :facebookId")})
public class Members implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "member_id")
    private Integer memberId;
    @Basic(optional = false)
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "role")
    private String role;
    @Basic(optional = false)
    @Column(name = "point")
    private float point;
    @Basic(optional = false)
    @Column(name = "level")
    private int level;
    @Column(name = "facebook_id")
    private String facebookId;
    @JoinTable(name = "following", joinColumns = {
        @JoinColumn(name = "followee_id", referencedColumnName = "member_id")}, inverseJoinColumns = {
        @JoinColumn(name = "followee_id", referencedColumnName = "member_id")})
    @ManyToMany
    private Collection<Members> membersCollection;
    @ManyToMany(mappedBy = "membersCollection")
    private Collection<Members> membersCollection1;
    @JoinTable(name = "subscriptions", joinColumns = {
        @JoinColumn(name = "member_id", referencedColumnName = "member_id")}, inverseJoinColumns = {
        @JoinColumn(name = "project_id", referencedColumnName = "project_id")})
    @ManyToMany
    private Collection<Projects> projectsCollection;
    @ManyToMany(mappedBy = "membersCollection")
    private Collection<Interests> interestsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "members")
    private Collection<MemberTeamPivot> memberTeamPivotCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "memberID")
    private Collection<DeleteLog> deleteLogCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<ReportLog> reportLogCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<Donations> donationsCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<UpdateLog> updateLogCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<Notifications> notificationsCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "members")
    private Address address;
    @OneToMany(mappedBy = "memberId")
    private Collection<ProjectDonations> projectDonationsCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<CreditCardInfo> creditCardInfoCollection;
    @OneToMany(mappedBy = "memberId")
    private Collection<EditLog> editLogCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "memberId")
    private Collection<Comments> commentsCollection;

    public Members() {
    }

    public Members(Integer memberId) {
        this.memberId = memberId;
    }

    public Members(Integer memberId, String username, String firstName, String lastName, String email, String role, float point, int level) {
        this.memberId = memberId;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
        this.point = point;
        this.level = level;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getFacebookId() {
        return facebookId;
    }

    public void setFacebookId(String facebookId) {
        this.facebookId = facebookId;
    }

    @XmlTransient
    public Collection<Members> getMembersCollection() {
        return membersCollection;
    }

    public void setMembersCollection(Collection<Members> membersCollection) {
        this.membersCollection = membersCollection;
    }

    @XmlTransient
    public Collection<Members> getMembersCollection1() {
        return membersCollection1;
    }

    public void setMembersCollection1(Collection<Members> membersCollection1) {
        this.membersCollection1 = membersCollection1;
    }

    @XmlTransient
    public Collection<Projects> getProjectsCollection() {
        return projectsCollection;
    }

    public void setProjectsCollection(Collection<Projects> projectsCollection) {
        this.projectsCollection = projectsCollection;
    }

    @XmlTransient
    public Collection<Interests> getInterestsCollection() {
        return interestsCollection;
    }

    public void setInterestsCollection(Collection<Interests> interestsCollection) {
        this.interestsCollection = interestsCollection;
    }

    @XmlTransient
    public Collection<MemberTeamPivot> getMemberTeamPivotCollection() {
        return memberTeamPivotCollection;
    }

    public void setMemberTeamPivotCollection(Collection<MemberTeamPivot> memberTeamPivotCollection) {
        this.memberTeamPivotCollection = memberTeamPivotCollection;
    }

    @XmlTransient
    public Collection<DeleteLog> getDeleteLogCollection() {
        return deleteLogCollection;
    }

    public void setDeleteLogCollection(Collection<DeleteLog> deleteLogCollection) {
        this.deleteLogCollection = deleteLogCollection;
    }

    @XmlTransient
    public Collection<ReportLog> getReportLogCollection() {
        return reportLogCollection;
    }

    public void setReportLogCollection(Collection<ReportLog> reportLogCollection) {
        this.reportLogCollection = reportLogCollection;
    }

    @XmlTransient
    public Collection<Donations> getDonationsCollection() {
        return donationsCollection;
    }

    public void setDonationsCollection(Collection<Donations> donationsCollection) {
        this.donationsCollection = donationsCollection;
    }

    @XmlTransient
    public Collection<UpdateLog> getUpdateLogCollection() {
        return updateLogCollection;
    }

    public void setUpdateLogCollection(Collection<UpdateLog> updateLogCollection) {
        this.updateLogCollection = updateLogCollection;
    }

    @XmlTransient
    public Collection<Notifications> getNotificationsCollection() {
        return notificationsCollection;
    }

    public void setNotificationsCollection(Collection<Notifications> notificationsCollection) {
        this.notificationsCollection = notificationsCollection;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @XmlTransient
    public Collection<ProjectDonations> getProjectDonationsCollection() {
        return projectDonationsCollection;
    }

    public void setProjectDonationsCollection(Collection<ProjectDonations> projectDonationsCollection) {
        this.projectDonationsCollection = projectDonationsCollection;
    }

    @XmlTransient
    public Collection<CreditCardInfo> getCreditCardInfoCollection() {
        return creditCardInfoCollection;
    }

    public void setCreditCardInfoCollection(Collection<CreditCardInfo> creditCardInfoCollection) {
        this.creditCardInfoCollection = creditCardInfoCollection;
    }

    @XmlTransient
    public Collection<EditLog> getEditLogCollection() {
        return editLogCollection;
    }

    public void setEditLogCollection(Collection<EditLog> editLogCollection) {
        this.editLogCollection = editLogCollection;
    }

    @XmlTransient
    public Collection<Comments> getCommentsCollection() {
        return commentsCollection;
    }

    public void setCommentsCollection(Collection<Comments> commentsCollection) {
        this.commentsCollection = commentsCollection;
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
        if (!(object instanceof Members)) {
            return false;
        }
        Members other = (Members) object;
        if ((this.memberId == null && other.memberId != null) || (this.memberId != null && !this.memberId.equals(other.memberId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Members[ memberId=" + memberId + " ]";
    }

}
