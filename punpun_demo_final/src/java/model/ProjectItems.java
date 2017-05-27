/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "project_items")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProjectItems.findAll", query = "SELECT p FROM ProjectItems p"),
    @NamedQuery(name = "ProjectItems.findByProjectId", query = "SELECT p FROM ProjectItems p WHERE p.projectItemsPK.projectId = :projectId"),
    @NamedQuery(name = "ProjectItems.findByItemId", query = "SELECT p FROM ProjectItems p WHERE p.projectItemsPK.itemId = :itemId"),
    @NamedQuery(name = "ProjectItems.findByAmount", query = "SELECT p FROM ProjectItems p WHERE p.amount = :amount")})
public class ProjectItems implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProjectItemsPK projectItemsPK;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "amount")
    private Float amount;
    @JoinColumn(name = "item_id", referencedColumnName = "item_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Items items;
    @JoinColumn(name = "project_id", referencedColumnName = "project_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Projects projects;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "projectItems")
    private Collection<ItemDonations> itemDonationsCollection;

    public ProjectItems() {
    }

    public ProjectItems(ProjectItemsPK projectItemsPK) {
        this.projectItemsPK = projectItemsPK;
    }

    public ProjectItems(int projectId, int itemId) {
        this.projectItemsPK = new ProjectItemsPK(projectId, itemId);
    }

    public ProjectItemsPK getProjectItemsPK() {
        return projectItemsPK;
    }

    public void setProjectItemsPK(ProjectItemsPK projectItemsPK) {
        this.projectItemsPK = projectItemsPK;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Items getItems() {
        return items;
    }

    public void setItems(Items items) {
        this.items = items;
    }

    public Projects getProjects() {
        return projects;
    }

    public void setProjects(Projects projects) {
        this.projects = projects;
    }

    @XmlTransient
    public Collection<ItemDonations> getItemDonationsCollection() {
        return itemDonationsCollection;
    }

    public void setItemDonationsCollection(Collection<ItemDonations> itemDonationsCollection) {
        this.itemDonationsCollection = itemDonationsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (projectItemsPK != null ? projectItemsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectItems)) {
            return false;
        }
        ProjectItems other = (ProjectItems) object;
        if ((this.projectItemsPK == null && other.projectItemsPK != null) || (this.projectItemsPK != null && !this.projectItemsPK.equals(other.projectItemsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProjectItems[ projectItemsPK=" + projectItemsPK + " ]";
    }

}
