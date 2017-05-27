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
@Table(name = "item_categories")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ItemCategories.findAll", query = "SELECT i FROM ItemCategories i"),
    @NamedQuery(name = "ItemCategories.findByItemCatagoryId", query = "SELECT i FROM ItemCategories i WHERE i.itemCatagoryId = :itemCatagoryId"),
    @NamedQuery(name = "ItemCategories.findByName", query = "SELECT i FROM ItemCategories i WHERE i.name = :name"),
    @NamedQuery(name = "ItemCategories.findByDescription", query = "SELECT i FROM ItemCategories i WHERE i.description = :description")})
public class ItemCategories implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "item_catagory_id")
    private Integer itemCatagoryId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "itemCategoryId")
    private Collection<Items> itemsCollection;

    public ItemCategories() {
    }

    public ItemCategories(Integer itemCatagoryId) {
        this.itemCatagoryId = itemCatagoryId;
    }

    public ItemCategories(Integer itemCatagoryId, String name) {
        this.itemCatagoryId = itemCatagoryId;
        this.name = name;
    }

    public Integer getItemCatagoryId() {
        return itemCatagoryId;
    }

    public void setItemCatagoryId(Integer itemCatagoryId) {
        this.itemCatagoryId = itemCatagoryId;
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
    public Collection<Items> getItemsCollection() {
        return itemsCollection;
    }

    public void setItemsCollection(Collection<Items> itemsCollection) {
        this.itemsCollection = itemsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemCatagoryId != null ? itemCatagoryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemCategories)) {
            return false;
        }
        ItemCategories other = (ItemCategories) object;
        if ((this.itemCatagoryId == null && other.itemCatagoryId != null) || (this.itemCatagoryId != null && !this.itemCatagoryId.equals(other.itemCatagoryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ItemCategories[ itemCatagoryId=" + itemCatagoryId + " ]";
    }

}
