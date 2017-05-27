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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name = "projects")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Projects.findAll", query = "SELECT p FROM Projects p"),
    @NamedQuery(name = "Projects.findByProjectId", query = "SELECT p FROM Projects p WHERE p.projectId = :projectId"),
    @NamedQuery(name = "Projects.findByName", query = "SELECT p FROM Projects p WHERE p.name = :name"),
    @NamedQuery(name = "Projects.findByLocation", query = "SELECT p FROM Projects p WHERE p.location = :location"),
    @NamedQuery(name = "Projects.findByFundingDuration", query = "SELECT p FROM Projects p WHERE p.fundingDuration = :fundingDuration"),
    @NamedQuery(name = "Projects.findByBudget", query = "SELECT p FROM Projects p WHERE p.budget = :budget"),
    @NamedQuery(name = "Projects.findByStartDate", query = "SELECT p FROM Projects p WHERE p.startDate = :startDate"),
    @NamedQuery(name = "Projects.findByEndDate", query = "SELECT p FROM Projects p WHERE p.endDate = :endDate"),
    @NamedQuery(name = "Projects.findByShortDescription", query = "SELECT p FROM Projects p WHERE p.shortDescription = :shortDescription"),
    @NamedQuery(name = "Projects.findByStory", query = "SELECT p FROM Projects p WHERE p.story = :story"),
    @NamedQuery(name = "Projects.findByStatus", query = "SELECT p FROM Projects p WHERE p.status = :status"),
    @NamedQuery(name = "Projects.findByPercent", query = "SELECT p FROM Projects p WHERE p.percent = :percent"),
    @NamedQuery(name = "Projects.findBySupporter", query = "SELECT p FROM Projects p WHERE p.supporter = :supporter"),
    @NamedQuery(name = "Projects.findByFunded", query = "SELECT p FROM Projects p WHERE p.funded = :funded")})
public class Projects implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "project_id")
    private Integer projectId;
    @Column(name = "name")
    private String name;
    @Column(name = "location")
    private String location;
    @Column(name = "funding_duration")
    private Integer fundingDuration;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "budget")
    private Float budget;
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Column(name = "short_description")
    private String shortDescription;
    @Column(name = "story")
    private String story;
    @Column(name = "status")
    private String status;
    @Column(name = "percent")
    private Float percent;
    @Column(name = "supporter")
    private Integer supporter;
    @Column(name = "funded")
    private Integer funded;
    @JoinTable(name = "project_tags", joinColumns = {
        @JoinColumn(name = "project_id", referencedColumnName = "project_id")}, inverseJoinColumns = {
        @JoinColumn(name = "tag_id", referencedColumnName = "tag_id")})
    @ManyToMany
    private Collection<Tags> tagsCollection;
    @ManyToMany(mappedBy = "projectsCollection")
    private Collection<Members> membersCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projects")
    private Collection<ProjectItems> projectItemsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projectID")
    private Collection<DeleteLog> deleteLogCollection;
    @OneToMany(mappedBy = "projectId")
    private Collection<ReportLog> reportLogCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projectId")
    private Collection<Donations> donationsCollection;
    @OneToMany(mappedBy = "projectId")
    private Collection<UpdateLog> updateLogCollection;
    @JoinColumn(name = "team_id", referencedColumnName = "team_id")
    @ManyToOne
    private Integer teamId;
    @JoinColumn(name = "project_category_id", referencedColumnName = "project_category_id")
    @ManyToOne
    private Integer projectCategoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projectId")
    private Collection<ProjectDonations> projectDonationsCollection;
    @OneToMany(mappedBy = "projectId")
    private Collection<EditLog> editLogCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projectId")
    private Collection<Comments> commentsCollection;

    public Projects() {
    }

    public Projects(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getFundingDuration() {
        return fundingDuration;
    }

    public void setFundingDuration(Integer fundingDuration) {
        this.fundingDuration = fundingDuration;
    }

    public Float getBudget() {
        return budget;
    }

    public void setBudget(Float budget) {
        this.budget = budget;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getPercent() {
        return percent;
    }

    public void setPercent(Float percent) {
        this.percent = percent;
    }

    public Integer getSupporter() {
        return supporter;
    }

    public void setSupporter(Integer supporter) {
        this.supporter = supporter;
    }

    public Integer getFunded() {
        return funded;
    }

    public void setFunded(Integer funded) {
        this.funded = funded;
    }

    @XmlTransient
    public Collection<Tags> getTagsCollection() {
        return tagsCollection;
    }

    public void setTagsCollection(Collection<Tags> tagsCollection) {
        this.tagsCollection = tagsCollection;
    }

    @XmlTransient
    public Collection<Members> getMembersCollection() {
        return membersCollection;
    }

    public void setMembersCollection(Collection<Members> membersCollection) {
        this.membersCollection = membersCollection;
    }

    @XmlTransient
    public Collection<ProjectItems> getProjectItemsCollection() {
        return projectItemsCollection;
    }

    public void setProjectItemsCollection(Collection<ProjectItems> projectItemsCollection) {
        this.projectItemsCollection = projectItemsCollection;
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

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public Integer getProjectCategoryId() {
        return projectCategoryId;
    }

    public void setProjectCategoryId(Integer projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }

    @XmlTransient
    public Collection<ProjectDonations> getProjectDonationsCollection() {
        return projectDonationsCollection;
    }

    public void setProjectDonationsCollection(Collection<ProjectDonations> projectDonationsCollection) {
        this.projectDonationsCollection = projectDonationsCollection;
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
        hash += (projectId != null ? projectId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Projects)) {
            return false;
        }
        Projects other = (Projects) object;
        if ((this.projectId == null && other.projectId != null) || (this.projectId != null && !this.projectId.equals(other.projectId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Projects[ projectId=" + projectId + " ]";
    }

}
