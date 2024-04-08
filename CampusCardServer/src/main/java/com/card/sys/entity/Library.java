package com.card.sys.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author baomidou
 * @since 2023-08-22
 */
@TableName("x_library")
public class Library implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "seat_id", type = IdType.AUTO)
    private Integer seatId;

    private String status;

    private Integer seatFloor;

    private String seatName;
    @TableField(value="user_id",updateStrategy = FieldStrategy.IGNORED)
    private Integer userId;


    @TableField(value="user_name",updateStrategy = FieldStrategy.IGNORED)
    private String userName;

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSeatFloor() {
        return seatFloor;
    }

    public void setSeatFloor(Integer seatFloor) {
        this.seatFloor = seatFloor;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }



    @Override
    public String toString() {
        return "Library{" +
            "seatId = " + seatId +
            ", status = " + status +
            ", seatFloor = " + seatFloor +
            ", seatName = " + seatName +
            ", userId = " + userId +
        "}";
    }
}
