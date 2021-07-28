//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.dm.platform.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.Pattern;

@Entity(
    name = "UserRole"
)
@Table(
    name = "T_USER_ROLE"
)
public class UserRole implements Serializable {
    private static final long serialVersionUID = 5751949149570819173L;
    private String code;
    private String name;
    private Long seq;
    private boolean enabled;
    private Set<UserAccount> users;
    private Set<UserMenu> menus;
    private String homePage;
    private String detail;
    private Set<MenuGroup> menugroups;

    public UserRole() {
    }

    @Id
    @Length(
        min = 2
    )
    @Pattern(
        regex = "[A-Za-z0-9_\\-]+"
    )
    @Column(
        name = "CODE",
        nullable = false,
        length = 50
    )
    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @NotEmpty
    @Length(
        min = 2
    )
    @Column(
        name = "NAME",
        nullable = false,
        length = 50
    )
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToMany(
        mappedBy = "roles",
        fetch = FetchType.EAGER
    )
    public Set<UserAccount> getUsers() {
        return this.users;
    }

    public void setUsers(Set<UserAccount> users) {
        this.users = users;
    }

    @Column(
        name = "ENABLED",
        nullable = false
    )
    public boolean isEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Column(
        name = "HOMEPAGE"
    )
    public String getHomePage() {
        return this.homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    @Column(
        name = "SEQ"
    )
    public Long getSeq() {
        return this.seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    @Column(
        name = "DETAIL"
    )
    public String getDetail() {
        return this.detail;
    }

    public void setDetail(String detial) {
        this.detail = detial;
    }

    @ManyToMany(
        fetch = FetchType.EAGER,
        cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST}
    )
    @JoinTable(
        name = "T_USER_ROLE_MENU_GROUP",
        joinColumns = {@JoinColumn(
    name = "ROLE_CODE",
    referencedColumnName = "CODE"
)},
        inverseJoinColumns = {@JoinColumn(
    name = "MENU_GROUP_ID",
    referencedColumnName = "ID"
)}
    )
    @OrderBy("seq asc")
    public Set<MenuGroup> getMenugroups() {
        return this.menugroups;
    }

    public void setMenugroups(Set<MenuGroup> menugroups) {
        this.menugroups = menugroups;
    }

    @ManyToMany(
        fetch = FetchType.EAGER,
        cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST}
    )
    @JoinTable(
        name = "T_ROLE_MENU",
        inverseJoinColumns = {@JoinColumn(
    name = "MENU_CODE",
    referencedColumnName = "ID"
)},
        joinColumns = {@JoinColumn(
    name = "ROLE_CODE",
    referencedColumnName = "CODE"
)}
    )
    @OrderBy("seq asc")
    public Set<UserMenu> getMenus() {
        return this.menus;
    }

    public void setMenus(Set<UserMenu> menus) {
        this.menus = menus;
    }

    public int hashCode() {
        return (new HashCodeBuilder()).append(this.getCode()).toHashCode();
    }

    public boolean equals(Object other) {
        if (!(other instanceof UserRole)) {
            return false;
        } else {
            UserRole cast = (UserRole)other;
            if (this.getCode() != null) {
                return cast.getCode().equals(this.getCode());
            } else {
                return false;
            }
        }
    }
}
