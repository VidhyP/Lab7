package ca.sait.lab7.models;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
/**
 * Represents a role
 *
 * @author Vidhy Patel
 */
@Entity
@Table (name = "role")
@NamedQueries({
    @NamedQuery(name = "Role.findAll", query = "SELECT r from Role r")    
    })
public class Role implements Serializable {
    
    @Column(name = "role_name")
    private String name;
    
    @Id
    @Basic
    @Column(name = "role_id")
    private int id;

    @OneToMany
    private List<User> user;

    public Role() {
    }

    public Role(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
