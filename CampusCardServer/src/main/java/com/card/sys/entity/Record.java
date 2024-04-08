package com.card.sys.entity;

import cn.hutool.core.annotation.Alias;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author baomidou
 * @since 2023-08-18
 */
@TableName("x_record")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Record implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "record_id", type = IdType.AUTO)
    @ExcelProperty(value = "记录编号")
    private Integer recordId;

    @ExcelProperty(value = "消费金额")
    private Integer cost;
    @ExcelProperty(value = "消费原因")
    private String reason;
    @ExcelProperty(value = "消费用户id")

    private Integer userId;


    @ExcelProperty(value = "消费人姓名")

    private String userName;


    @ExcelProperty(value = "消费时间")
    private String time;



    @ExcelProperty(value = "退费状态")
    private Integer refund;
    @ExcelProperty(value = "是否删除")
    private Integer deleted;



    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getRefund() {
        return refund;
    }

    public void setRefund(Integer refund) {
        this.refund = refund;
    }

    @Override
    public String toString() {
        return "Record{" +
            "recordId = " + recordId +
            ", cost = " + cost +
            ", reason = " + reason +
            ", userId = " + userId +
            ", deleted = " + deleted +
        "}";
    }
}
