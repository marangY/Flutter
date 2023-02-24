package com.example.bpm.entity;

import com.example.bpm.dto.UserDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.catalina.User;

@Entity
@Getter
@Setter
@Table(name = "user")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String userEmail;
    @Column
    private String userPassword;
    @Column
    private String userName;

    public static UserEntity toUserEntity(UserDto userDto) {
        UserEntity userEntity = new UserEntity();
        userEntity.setUserEmail(userDto.getUserEmail());
        userEntity.setUserPassword(userDto.getUserPassword());
        userEntity.setUserName((userDto.getUserName()));
        return userEntity;
    }
    public static UserEntity toUpdateuserEntity(UserDto userDto) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userDto.getId());
        userEntity.setUserEmail(userDto.getUserEmail());
        userEntity.setUserPassword(userDto.getUserPassword());
        userEntity.setUserName(userDto.getUserName());
        return userEntity;
    }
}
