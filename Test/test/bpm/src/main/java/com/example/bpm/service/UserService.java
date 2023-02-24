package com.example.bpm.service;

import com.example.bpm.dto.UserDto;
import com.example.bpm.entity.UserEntity;
import com.example.bpm.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    final private UserRepository userRepository;

    public void save(UserDto userDto) {
        //DTO -> Entity 변환
        UserEntity userEntity = UserEntity.toUserEntity(userDto);
        //Repository의 내장 함수 save로 DB 넘김
        userRepository.save(userEntity);
    }

    public UserDto login(UserDto userDto) {
        //DB에 이메일 조회
        Optional<UserEntity> byUserEmail = userRepository.findByUserEmail(userDto.getUserEmail());
        //조회한 이메일 DB에 존재하는가?
        if (byUserEmail.isPresent()) {
            //Optional로 묶여진 byUserEmail 값을 Entity로 변환
            UserEntity userEntity = byUserEmail.get();
            if (userEntity.getUserPassword().equals(userDto.getUserPassword())) {
                //Entity -> DTO 변환
                UserDto result = userDto.toUserDto(userEntity);
                return result;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
    //사용자 목록 가져오기
    public List<UserDto> finaAll() {
        List<UserEntity> userEntityList = userRepository.findAll();
        List<UserDto> userDtoList = new ArrayList<>();
        for (UserEntity userEntity : userEntityList) {
//            UserDto userDto = UserDto.toUserDto(userEntity);
//            userDtoList.add(userDto);               밑에 함수와 같은 결과
            userDtoList.add(UserDto.toUserDto(userEntity));
        }
        return userDtoList;
    }
}