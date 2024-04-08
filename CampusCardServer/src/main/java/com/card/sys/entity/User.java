package com.card.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author baomidou
 * @since 2023-08-13
 */
@TableName("x_user")
@Data
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private String gender;
    private String email;
    private String phone;
    private Integer status;
    private String avatar;
    private Integer money;
    private Integer deleted;


    private String num;


    @TableField(exist = false)
    private List<Integer> roleIdList;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
}
