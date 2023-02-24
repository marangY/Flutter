package com.example.bpm.dto;

import com.example.bpm.entity.UserEntity;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDto {
    private Long id;
    private String userEmail;
    private String userPassword;
    private String userName;

    public static UserDto toUserDto(UserEntity userEntity) {
        UserDto userDto = new UserDto();
        userDto.setId(userEntity.getId());
        userDto.setUserEmail(userEntity.getUserEmail());
        userDto.setUserPassword(userEntity.getUserPassword());
        userDto.setUserName(userEntity.getUserName());
        return userDto;
    }
}