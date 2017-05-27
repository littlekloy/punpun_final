/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author kanok
 */
@Embeddable
public class ProjectItemsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "project_id")
    private int projectId;
    @Basic(optional = false)
    @Column(name = "item_id")
    private int itemId;

    public ProjectItemsPK() {
    }

    public ProjectItemsPK(int projectId, int itemId) {
        this.projectId = projectId;
        this.itemId = itemId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) projectId;
        hash += (int) itemId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectItemsPK)) {
            return false;
        }
        ProjectItemsPK other = (ProjectItemsPK) object;
        if (this.projectId != other.projectId) {
            return false;
        }
        if (this.itemId != other.itemId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProjectItemsPK[ projectId=" + projectId + ", itemId=" + itemId + " ]";
    }

}
