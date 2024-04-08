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
 * @since 2023-08-30
 */
@TableName("x_information")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Information implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "information_id", type = IdType.AUTO)
    private Integer informationId;

    private String content;

    private String title;

    private Integer userId;

    public Integer getInformationId() {
        return informationId;
    }

    public void setInformationId(Integer informationId) {
        this.informationId = informationId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Information{" +
            "informationId = " + informationId +
            ", content = " + content +
            ", title = " + title +
            ", userId = " + userId +
        "}";
    }
}
