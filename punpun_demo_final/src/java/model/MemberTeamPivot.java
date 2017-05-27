/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
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
@Table(name = "member_team_pivot")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MemberTeamPivot.findAll", query = "SELECT m FROM MemberTeamPivot m"),
    @NamedQuery(name = "MemberTeamPivot.findByMemberId", query = "SELECT m FROM MemberTeamPivot m WHERE m.memberTeamPivotPK.memberId = :memberId"),
    @NamedQuery(name = "MemberTeamPivot.findByTeamId", query = "SELECT m FROM MemberTeamPivot m WHERE m.memberTeamPivotPK.teamId = :teamId"),
    @NamedQuery(name = "MemberTeamPivot.findByPosition", query = "SELECT m FROM MemberTeamPivot m WHERE m.position = :position")})
public class MemberTeamPivot implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MemberTeamPivotPK memberTeamPivotPK;
    @Column(name = "position")
    private String position;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Members members;
    @JoinColumn(name = "team_id", referencedColumnName = "team_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Teams teams;

    public MemberTeamPivot() {
    }

    public MemberTeamPivot(MemberTeamPivotPK memberTeamPivotPK) {
        this.memberTeamPivotPK = memberTeamPivotPK;
    }

    public MemberTeamPivot(int memberId, int teamId) {
        this.memberTeamPivotPK = new MemberTeamPivotPK(memberId, teamId);
    }

    public MemberTeamPivotPK getMemberTeamPivotPK() {
        return memberTeamPivotPK;
    }

    public void setMemberTeamPivotPK(MemberTeamPivotPK memberTeamPivotPK) {
        this.memberTeamPivotPK = memberTeamPivotPK;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Members getMembers() {
        return members;
    }

    public void setMembers(Members members) {
        this.members = members;
    }

    public Teams getTeams() {
        return teams;
    }

    public void setTeams(Teams teams) {
        this.teams = teams;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (memberTeamPivotPK != null ? memberTeamPivotPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MemberTeamPivot)) {
            return false;
        }
        MemberTeamPivot other = (MemberTeamPivot) object;
        if ((this.memberTeamPivotPK == null && other.memberTeamPivotPK != null) || (this.memberTeamPivotPK != null && !this.memberTeamPivotPK.equals(other.memberTeamPivotPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.MemberTeamPivot[ memberTeamPivotPK=" + memberTeamPivotPK + " ]";
    }

}
