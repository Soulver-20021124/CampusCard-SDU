package com.card.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author baomidou
 * @since 2023-08-23
 */
@TableName("x_is_pay")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class IsPay implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "is_pay_id", type = IdType.AUTO)
    private Integer isPayId;

    private Integer paymentId;

    private Integer userId;



    private String  userName;

    private Integer price;


    private String time;



    private String paymentName;

    public Integer getIsPayId() {
        return isPayId;
    }

    public void setIsPayId(Integer isPayId) {
        this.isPayId = isPayId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "IsPay{" +
            "isPayId = " + isPayId +
            ", paymentId = " + paymentId +
            ", userId = " + userId +
        "}";
    }
}
