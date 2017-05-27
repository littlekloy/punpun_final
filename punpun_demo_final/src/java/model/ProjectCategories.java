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
@Table(name = "project_categories")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProjectCategories.findAll", query = "SELECT p FROM ProjectCategories p"),
    @NamedQuery(name = "ProjectCategories.findByProjectCategoryId", query = "SELECT p FROM ProjectCategories p WHERE p.projectCategoryId = :projectCategoryId"),
    @NamedQuery(name = "ProjectCategories.findByName", query = "SELECT p FROM ProjectCategories p WHERE p.name = :name"),
    @NamedQuery(name = "ProjectCategories.findByDescription", query = "SELECT p FROM ProjectCategories p WHERE p.description = :description")})
public class ProjectCategories implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "project_category_id")
    private Integer projectCategoryId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @OneToMany(mappedBy = "projectCategoryId")
    private Collection<Projects> projectsCollection;

    public ProjectCategories() {
    }

    public ProjectCategories(Integer projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }

    public ProjectCategories(Integer projectCategoryId, String name) {
        this.projectCategoryId = projectCategoryId;
        this.name = name;
    }

    public Integer getProjectCategoryId() {
        return projectCategoryId;
    }

    public void setProjectCategoryId(Integer projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<Projects> getProjectsCollection() {
        return projectsCollection;
    }

    public void setProjectsCollection(Collection<Projects> projectsCollection) {
        this.projectsCollection = projectsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (projectCategoryId != null ? projectCategoryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectCategories)) {
            return false;
        }
        ProjectCategories other = (ProjectCategories) object;
        if ((this.projectCategoryId == null && other.projectCategoryId != null) || (this.projectCategoryId != null && !this.projectCategoryId.equals(other.projectCategoryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProjectCategories[ projectCategoryId=" + projectCategoryId + " ]";
    }

}
